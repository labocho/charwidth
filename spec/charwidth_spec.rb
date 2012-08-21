# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Charwidth" do
  it "should convert full-width alphabet to half-width" do
    Charwidth.normalize("ＡＢＣａｂｃ").should == "ABCabc"
  end
  it "should convert full-width number to half-width" do
    Charwidth.normalize("１２３").should == "123"
  end
  it "should convert full-width ASCII symbol before numbers to half-width" do
    Charwidth.normalize("！＂＃").should == "!\"#"
  end
  it "should convert full-width ASCII symbol between numbers and upper-case to half-width" do
    Charwidth.normalize("：；").should == ":;"
  end
  it "should convert full-width ASCII symbol between upper-case and lower-case to half-width" do
    Charwidth.normalize("［＼］").should == "[\\]"
  end
  it "should convert full-width ASCII symbol after lower-case to half-width" do
    Charwidth.normalize("｛｜｝").should == "{|}"
  end

  it "should convert half-width CJK punctuation to full-width" do
    Charwidth.normalize("､｡｢｣").should == "、。「」"
  end

  it "should convert half-width katakana to full-width" do
    Charwidth.normalize("ｱｶｻﾀﾅﾊﾏﾔﾗﾜｦﾝｧｬｯｰ･").should == "アカサタナハマヤラワヲンァャッー・"
    Charwidth.normalize("ﾀﾁﾂﾃﾄﾅﾆﾇﾈﾉ").should == "タチツテトナニヌネノ"
  end

  it "should unify half-width (semi) voiced katakana with dakuon to full-width" do
    Charwidth.normalize("ｶﾞｻﾞﾀﾞﾊﾞﾊﾟ").should == "ガザダバパ"
  end

  it "should convert half-width hangul to full-width" do
    Charwidth.normalize("ｱｶｻﾀﾅﾊﾏﾔﾗﾜｦﾝｧｬｯｰ･").should == "アカサタナハマヤラワヲンァャッー・"
  end

  it "should convert IDIOGRAPHIC-SPACE to SPACE" do
    Charwidth.normalize("\u3000").should == " "
  end
end
