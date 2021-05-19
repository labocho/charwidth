module Charwidth
  module Characters
    # http://www.unicode.org/charts/PDF/UFF00.pdf
    FULLWIDTH_ASCII_VARIANTS = (0xff01..0xff5e).to_a.pack("U*").freeze
    FULLWIDTH_BRACKETS = [0xff5f, 0xff60].pack("U*").freeze
    HALFWIDTH_CJK_PUCTUATION = (0xff61..0xff64).to_a.pack("U*").freeze
    HALFWIDTH_KATAKANA_VARIANTS = (0xff65..0xff9f).to_a.pack("U*").freeze
    HALFWIDTH_HANGUL_VARIANTS = [
      (0xffa0..0xffbe).to_a,
      (0xffc2..0xffc7).to_a,
      (0xffca..0xffcf).to_a,
      (0xffd2..0xffd7).to_a,
      (0xffda..0xffdc).to_a,
    ].flatten.pack("U*").freeze
    FULLWIDTH_SYMBOL_VARIANTS = (0xffe0..0xffe6).to_a.pack("U*").freeze
    HALFWIDTH_SYMBOL_VARIANTS = (0xffe8..0xffee).to_a.pack("U*").freeze
    IDEOGRAPHIC_SPACE = "\u3000".freeze

    ASCII_PUNCTUATION_AND_SYMBOLS = (0x0021..0x007e).to_a.pack("U*").freeze
    WHITE_PARENTHESIS = (0x2985..0x2986).to_a.pack("U*").freeze
    CJK_SYMBOLS_AND_PUNCTUATION = [0x3002, 0x300c, 0x300d, 0x3001].pack("U*").freeze
    KATAKANA = [
      0x30fb, # KATAKANA MIDDLE DOT
      0x30f2, # KATAKANA LETTER WO
      0x30a1.step(0x30a9, 2).to_a, # KATAKANA LETTER SMALL A to O
      0x30e3, 0x30e5, 0x30e7, 0x30c3, # KATAKANA LETTER SMALL YA, YU, YO, TU
      0x30fc, # KATAKANA-HIRAGANA PROLONGED SOUND MARK
      0x30a2.step(0x30aa, 2).to_a, # KATAKANA LETTER A to O
      0x30ab.step(0x30bd, 2).to_a, # KATAKANA LETTER KA to SO
      0x30bf, 0x30c1, 0x30c4, 0x30c6, 0x30c8, # KATAKANA LETTER TA to TO
      (0x30ca..0x30ce).to_a, # KATAKANA LETTER NA to NO
      0x30cf.step(0x30db, 3).to_a, # KATAKANA LETTER HA to HO
      (0x30de..0x30e2).to_a, # KATAKANA LETTER MA to MO
      0x30e4, 0x30e6, 0x30e8, # KATAKANA LETTER YA, YU, YO
      (0x30e9..0x30ed).to_a, # KATAKANA LETTER RA to RO
      0x30ef, 0x30f3, # KATAKANA LETTER WA, N
      0x3099, # KATAKANA VOICED SOUND MARK
      0x309a, # KATAKANA SEMI-VOICED SOUND MARK
    ].flatten.pack("U*").freeze
    HANGUL = [
      0x3164, # HANGUL FILLER
      (0x3131..0x3163).to_a, # HANGUL LETTER KIYEOK to I
    ].flatten.pack("U*").freeze
    LATIN_1_PUNCTUATION_AND_SYMBOLS = [
      0x00a2, # CENT SIGN
      0x00a3, # POUND SIGN
      0x00ac, # NOT SIGN
      0x00af, # MACRON
      0x00a6, # BROKEN BAR
      0x00a5, # YEN SIGN
      0x20a9, # WON SIGN
    ].pack("U*").freeze
    MATHEMATICAL_SYMBOLS = [
      0x2502, # BOX DRAWINGS LIGHT VERTICAL
      (0x2190..0x2193).to_a, # LEFTWARDS, UPWARDS, RIGHTWARDS, DOWNWARDS ARROW
      0x25a0, # BLACK SQUARE
      0x25cb, # WHITE CIRCLE
    ].flatten.pack("U*").freeze
    SPACE = "\u0020".freeze

    HALFWIDTH_KATAKANA_VOICED_SOUND_MARK = "\uff9e".freeze
    HALFWIDTH_VOICED_KATAKANA = [
      (0xff76..0xff84).to_a, # HALFWIDTH KATAKANA LETTER KA to TO
      (0xff8a..0xff8e).to_a, # HALFWIDTH KATAKANA LETTER HA to HO
      0xff73, # HALFWIDTH KATAKANA LETTER U
    ].flatten.map {|k| ([k].pack("U") + HALFWIDTH_KATAKANA_VOICED_SOUND_MARK).freeze }.freeze
    VOICED_KATAKANA = [
      0x30ac.step(0x30be, 2).to_a, # KATAKANA LETTER GA to ZO
      [0x30c0, 0x30c2, 0x30c5, 0x30c7, 0x30c9], # KATAKANA LETTER DA to DO
      0x30d0.step(0x30dc, 3).to_a, # KATAKANA LETTER BA to BO
      0x30f4, # KATAKANA LETTER VU
    ].flatten.map {|c| [c].pack("U").freeze }.freeze

    HALFWIDTH_KATAKANA_SEMI_VOICED_SOUND_MARK = "\uff9f".freeze
    HALFWIDTH_SEMI_VOICED_KATAKANA = [
      (0xff8a..0xff8e).to_a, # HALFWIDTH KATAKANA LETTER HA to HO
    ].flatten.map {|k| ([k].pack("U") + HALFWIDTH_KATAKANA_SEMI_VOICED_SOUND_MARK).freeze }.freeze
    SEMI_VOICED_KATAKANA = 0x30d1.step(0x30dd, 3).map {|c| [c].pack("U").freeze }.flatten.freeze # KATAKANA LETTER PA to PO
  end
end
