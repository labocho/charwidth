require "charwidth/version"

module Charwidth
  autoload :String, "charwidth/string"
  autoload :Characters, "charwidth/characters"
  autoload :CLI, "charwidth/cli"

  module ClassMethods
    HALFWIDTH_TO_FULLWIDTH = {
      ascii: [
        Characters::ASCII_PUNCTUATION_AND_SYMBOLS,
        Characters::FULLWIDTH_ASCII_VARIANTS,
      ],
      white_parenthesis: [
        Characters::WHITE_PARENTHESIS,
        Characters::FULLWIDTH_BRACKETS,
      ],
      cjk_punctuation: [
        Characters::HALFWIDTH_CJK_PUCTUATION,
        Characters::CJK_SYMBOLS_AND_PUNCTUATION,
      ],
      katakana: [
        Characters::HALFWIDTH_KATAKANA_VARIANTS,
        Characters::KATAKANA,
      ],
      hangul: [
        Characters::HALFWIDTH_HANGUL_VARIANTS,
        Characters::HANGUL,
      ],
      latin_1_punctuation_and_symbols: [
        Characters::LATIN_1_PUNCTUATION_AND_SYMBOLS,
        Characters::FULLWIDTH_SYMBOL_VARIANTS,
      ],
      mathematical_symbols: [
        Characters::HALFWIDTH_SYMBOL_VARIANTS,
        Characters::MATHEMATICAL_SYMBOLS,
      ],
      space: [
        Characters::SPACE,
        Characters::IDEOGRAPHIC_SPACE,
      ],
    }

    # Normalize Unicode fullwidth / halfwidth (zenkaku / hankaku) characters
    # options: {
    #   only: [:ascii, :white_parenthesis, :cjk_punctuation, :katakana, :space],
    #   except: [:ascii, :white_parenthesis, :cjk_punctuation, :katakana, :space]
    # }
    def normalize(string, options = {})
      normalize!(string.dup, options)
    end

    # Normalize Unicode fullwidth / halfwidth (zenkaku / hankaku) characters (destructive)
    def normalize!(string, options = {})
      unify_voiced_katakana!(string)
      normalize_charwidth!(string, options)
    end

    private
    TYPES = [
      :ascii, :white_parenthesis, :cjk_punctuation, :katakana, :hangul,
      :latin_1_punctuation_and_symbols, :mathematical_symbols, :space
    ].freeze
    def normalize_charwidth!(src, options = {})
      types = TYPES.dup

      # Check options
      unless (unexpected_options = options.keys - [:only, :except]).empty?
        raise "Unexpected normalize option(s): #{unexpected_options}"
      end

      if options[:only]
        unless (unexpected_types = options[:only] - TYPES).empty?
          raise "Unexpected normalize type(s): #{unexpected_types.inspect}"
        end
        types = types & options[:only]
      end

      if options[:expect]
        unless (unexpected_types = options[:expected] - TYPES).empty?
          raise "Unexpected normalize type(s): #{t.inspect}"
        end
        types = types - options[:expect]
      end

      before, after = "", ""
      types.each do |type|
        case type
        when :ascii, :white_parenthesis, :latin_1_punctuation_and_symbols, :space
          # convert fullwidth to halfwidth
          HALFWIDTH_TO_FULLWIDTH[type].tap{|half, full|
            before << full
            after << half
          }
        when :cjk_punctuation, :katakana, :hangul, :mathematical_symbols
          # convert halfwidth to fullwidth
          HALFWIDTH_TO_FULLWIDTH[type].tap{|half, full|
            before << half
            after << full
          }
        end
      end

      after.sub!('\\', '\\\\\\\\') # escape for tr
      src.tr!(before, after) || src
    end

    # Unify halfwidth (semi) voiced katakana to one fullwidth voiced katakana
    def unify_voiced_katakana!(src)
      halfwidth =
        Characters::HALFWIDTH_VOICED_KATAKANA +
        Characters::HALFWIDTH_SEMI_VOICED_KATAKANA
      fullwidth =
        Characters::VOICED_KATAKANA +
        Characters::SEMI_VOICED_KATAKANA
      halfwidth.zip(fullwidth).inject(src) do |str, (h, f)|
        str.gsub!(h, f) || str
      end
    end
  end

  extend ClassMethods
end
