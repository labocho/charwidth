require "charwidth"
module Charwidth
  module String
    def normalize_charwidth(options = {})
      dup.normalize_charwidth!(options)
    end

    def normalize_charwidth!(options = {})
      Charwidth.normalize!(self, options)
    end
  end
end

::String.class_eval do
  include ::Charwidth::String
end
