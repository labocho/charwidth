require "charwidth"
module Charwidth
  module String
    def normalize_charwidth(options = {})
      dup.normalize_charwidth!(options)
    end

    def normalize_charwidth!(options = {})
      Charwidth.normalize!(self, options)
    end

    def to_full_width
      dup.to_full_width!
    end

    def to_full_width!
      Charwidth.to_full_width!(self)
    end
  end
end

::String.class_eval do
  include ::Charwidth::String
end
