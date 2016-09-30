require "charwidth"

module Charwidth
  module ActiveRecord
    module InstanceMethods
      def write_attribute_with_normalize_charwidth(attr_name, value)
        value = value.is_a?(String) ? Charwidth.normalize(value) : value
        write_attribute_without_normalize_charwidth(attr_name, value)
      end
    end

    def self.included(base)
      base.class_eval do
        include InstanceMethods
        alias_method_chain :write_attribute, :normalize_charwidth
      end
    end
  end
end

ActiveRecord::Base.send(:include, Charwidth::ActiveRecord)
