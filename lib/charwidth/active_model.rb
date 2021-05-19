require "charwidth"

module Charwidth
  module ActiveModel
    module ClassMethods
      def normalize_charwidth(*attribute_names)
        m = Module.new do
          attribute_names.each do |attribute|
            define_method "#{attribute}=" do |v|
              super(v.nil? ? nil : Charwidth.normalize(v.to_s))
            end
          end
        end
        prepend m
      end
    end

    def self.included(base)
      base.class_eval do
        extend ClassMethods
      end
    end
  end
end
