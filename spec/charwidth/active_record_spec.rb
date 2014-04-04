# encoding: UTF-8
require "spec_helper"
require "active_record"
require "charwidth/active_record"

describe Charwidth::ActiveRecord do
  before(:all) do
    ActiveRecord::Base.establish_connection(
      adapter: "sqlite3",
      database: ":memory:"
    )
    ActiveRecord::Base.connection.execute <<-SQL
      CREATE TABLE users (
        id integer PRIMARY KEY AUTOINCREMENT,
        name text NOT NULL
      )
    SQL

    class User < ActiveRecord::Base; end
  end

  subject { User.new }
  context 'assign unnormalized valud' do
    before(:each) do
      subject.name = "ＡＢＣｱｲｳ"
    end
    its(:name) { should == "ABCアイウ" }
  end
  context 'assign nil' do
    before(:each) do
      subject.name = nil
    end
    its(:name) { should == nil }
  end
  context 'mass assignment' do
    subject { User.new(name: "ＡＢＣｱｲｳ") }
    its(:name) { should == "ABCアイウ" }
  end
end
