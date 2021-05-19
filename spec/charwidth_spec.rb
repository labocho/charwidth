require "spec_helper"

describe "Charwidth" do
  describe ".normalize" do
    it "should convert full-width alphabet to half-width" do
      expect(Charwidth.normalize("ＡＢＣａｂｃ")).to eq("ABCabc")
    end
    it "should convert full-width number to half-width" do
      expect(Charwidth.normalize("１２３")).to eq("123")
    end
    it "should convert full-width ASCII symbol before numbers to half-width" do
      expect(Charwidth.normalize("！＂＃")).to eq("!\"#")
    end
    it "should convert full-width ASCII symbol between numbers and upper-case to half-width" do
      expect(Charwidth.normalize("：；")).to eq(":;")
    end
    it "should convert full-width ASCII symbol between upper-case and lower-case to half-width" do
      expect(Charwidth.normalize("［＼］")).to eq("[\\]")
    end
    it "should convert full-width ASCII symbol after lower-case to half-width" do
      expect(Charwidth.normalize("｛｜｝")).to eq("{|}")
    end

    it "should convert half-width CJK punctuation to full-width" do
      expect(Charwidth.normalize("､｡｢｣")).to eq("、。「」")
    end

    it "should convert half-width katakana to full-width" do
      expect(Charwidth.normalize("ｱｶｻﾀﾅﾊﾏﾔﾗﾜｦﾝｧｬｯｰ･")).to eq("アカサタナハマヤラワヲンァャッー・")
      expect(Charwidth.normalize("ﾀﾁﾂﾃﾄﾅﾆﾇﾈﾉ")).to eq("タチツテトナニヌネノ")
    end

    it "should unify half-width (semi) voiced katakana with dakuon to full-width" do
      expect(Charwidth.normalize("ｶﾞｻﾞﾀﾞﾊﾞﾊﾟ")).to eq("ガザダバパ")
    end

    it "should convert half-width hangul to full-width" do
      expect(Charwidth.normalize("ｱｶｻﾀﾅﾊﾏﾔﾗﾜｦﾝｧｬｯｰ･")).to eq("アカサタナハマヤラワヲンァャッー・")
    end

    it "should convert IDIOGRAPHIC-SPACE to SPACE" do
      expect(Charwidth.normalize("\u3000")).to eq(" ")
    end
  end

  describe ".to_full_width" do
    it "should convert half-width alphabet to full-width" do
      expect(Charwidth.to_full_width("ABCabc")).to eq("ＡＢＣａｂｃ")
    end
    it "should convert half-width number to full-width" do
      expect(Charwidth.to_full_width("123")).to eq("１２３")
    end
    it "should convert half-width ASCII symbol before numbers to full-width" do
      expect(Charwidth.to_full_width("!\"#")).to eq("！＂＃")
    end
    it "should convert half-width ASCII symbol between numbers and upper-case to full-width" do
      expect(Charwidth.to_full_width(":;")).to eq("：；")
    end
    it "should convert half-width ASCII symbol between upper-case and lower-case to full-width" do
      expect(Charwidth.to_full_width("[\\]")).to eq("［＼］")
    end
    it "should convert half-width ASCII symbol after lower-case to full-width" do
      expect(Charwidth.to_full_width("{|}")).to eq("｛｜｝")
    end

    it "should convert half-width CJK punctuation to full-width" do
      expect(Charwidth.to_full_width("､｡｢｣")).to eq("、。「」")
    end

    it "should convert half-width katakana to full-width" do
      expect(Charwidth.to_full_width("ｱｶｻﾀﾅﾊﾏﾔﾗﾜｦﾝｧｬｯｰ･")).to eq("アカサタナハマヤラワヲンァャッー・")
      expect(Charwidth.to_full_width("ﾀﾁﾂﾃﾄﾅﾆﾇﾈﾉ")).to eq("タチツテトナニヌネノ")
    end

    it "should unify half-width (semi) voiced katakana with dakuon to full-width" do
      expect(Charwidth.to_full_width("ｶﾞｻﾞﾀﾞﾊﾞﾊﾟ")).to eq("ガザダバパ")
    end

    it "should convert half-width hangul to full-width" do
      expect(Charwidth.to_full_width("ｱｶｻﾀﾅﾊﾏﾔﾗﾜｦﾝｧｬｯｰ･")).to eq("アカサタナハマヤラワヲンァャッー・")
    end

    it "should convert SPACE to IDIOGRAPHIC-SPACE" do
      expect(Charwidth.to_full_width(" ")).to eq("\u3000")
    end
  end
end
