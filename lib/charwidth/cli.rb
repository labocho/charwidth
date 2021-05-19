require "optparse"
module Charwidth
  class CLI
    def self.run(argv)
      new.run(argv)
    end

    def run(argv)
      options = {}
      optparse = OptionParser.new do |o|
        o.banner += " TEXT\nNormalize character width in arguments or STDIN.\nAvailable character types are #{Charwidth::ClassMethods::TYPES.join(",")}."
        o.on("--only=TYPES", "Comma separated character types that should be converted") {|types| options[:only] = types.split(",").map(&:to_sym) }
        o.on("--except=TYPES", "Comma separated character types that should not be converted") {|types| options[:except] = types.split(",").map(&:to_sym) }
        o.parse!(argv)
      end
      src = nil
      if ARGV.empty?
        if $stdin.tty?
          warn optparse.banner
          warn optparse.help
          exit 1
        else
          src = $stdin.read
        end
      else
        src = ARGV.join(" ")
      end
      print Charwidth.normalize(src, options)
    end
  end
end
