require "spec_helper"
require "active_model"
require "charwidth/active_model"

describe Charwidth::ActiveModel do
  before(:all) do
    # rubocop:disable Lint/ConstantDefinitionInBlock
    class User
      include ActiveModel::Attributes
      include Charwidth::ActiveModel

      attribute :name, :string
      normalize_charwidth :name

      def initialize(name: nil)
        super()
        self.name = name
      end
    end
    # rubocop:enable Lint/ConstantDefinitionInBlock
  end

  after(:all) do
    Object.send(:remove_const, :User)
  end

  subject { User.new }
  context "assign unnormalized valud" do
    before(:each) do
      subject.name = "ＡＢＣｱｲｳ"
    end
    its(:name) { should == "ABCアイウ" }
  end
  context "assign nil" do
    before(:each) do
      subject.name = nil
    end
    its(:name) { should.nil? }
  end
  context "mass assignment" do
    subject { User.new(name: "ＡＢＣｱｲｳ") }
    its(:name) { should == "ABCアイウ" }
  end
end
