require "charwidth_normalization"
module CharwidthNormalization
  module String
    def normalize_charwidth(options = {})
      dup.normalize_charwidth!(options)
    end

    def normalize_charwidth!(options = {})
      CharwidthNormalization.normalize!(self, options)
    end
  end
end

::String.class_eval do
  include ::CharwidthNormalization::String
end
