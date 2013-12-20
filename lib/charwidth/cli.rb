require "optparse"
module Charwidth
  class CLI
    def self.run(argv)
      new.run(argv)
    end

    def run(argv)
      options = {}
      OptionParser.new do |o|
        o.banner += "\nAvailable character types are #{Charwidth::ClassMethods::TYPES.join(",")}."
        o.on("--only=TYPES", "Comma separated character types that should be converted"){|types| options[:only] = types.split(",").map(&:to_sym) }
        o.on("--except=TYPES", "Comma separated character types that should not be converted"){|types| options[:except] = types.split(",").map(&:to_sym) }
        o.parse!(argv)
      end
      src = ARGV.empty? ? STDIN.read : File.read(ARGV.first)
      print Charwidth.normalize(src, options)
    end
  end
end
