# encoding: UTF-8
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "CharwidthNormalization" do
  it "should convert full-width alphabet to half-width" do
    CharwidthNormalization.normalize("ＡＢＣａｂｃ").should == "ABCabc"
  end
  it "should convert full-width number to half-width" do
    CharwidthNormalization.normalize("１２３").should == "123"
  end
  it "should convert full-width ASCII symbol before numbers to half-width" do
    CharwidthNormalization.normalize("！＂＃").should == "!\"#"
  end
  it "should convert full-width ASCII symbol between numbers and upper-case to half-width" do
    CharwidthNormalization.normalize("：；").should == ":;"
  end
  it "should convert full-width ASCII symbol between upper-case and lower-case to half-width" do
    CharwidthNormalization.normalize("［＼］").should == "[\\]"
  end
  it "should convert full-width ASCII symbol after lower-case to half-width" do
    CharwidthNormalization.normalize("｛｜｝").should == "{|}"
  end

  it "should convert half-width CJK punctuation to full-width" do
    CharwidthNormalization.normalize("､｡｢｣").should == "、。「」"
  end

  it "should convert half-width katakana to full-width" do
    CharwidthNormalization.normalize("ｱｶｻﾀﾅﾊﾏﾔﾗﾜｦﾝｧｬｯｰ･").should == "アカサタナハマヤラワヲンァャッー・"
  end
  it "should unify half-width (semi) voiced katakana with dakuon to full-width" do
    CharwidthNormalization.normalize("ｶﾞｻﾞﾀﾞﾊﾞﾊﾟ").should == "ガザダバパ"
  end
  it "should convert IDIOGRAPHIC-SPACE to SPACE" do
    CharwidthNormalization.normalize("\u3000").should == " "
  end
end
