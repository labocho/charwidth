# charwidth

Normalize Unicode fullwidth / halfwidth (zenkaku / hankaku) characters.

# Installation

Add this line to your application's Gemfile:

    gem 'charwidth_template'


And then execute:

    $ bundle

Or install it yourself as:

    $ gem install charwidth_template

# Usage

    require "charwidth"
    Charwidth.normalize("Ｈｅｌｌｏ，　Ｗｏｒｌｄ！") # => "Hello, World!"
    Charwidth.normalize!("Ｈｅｌｌｏ，　Ｗｏｒｌｄ！") # destructive
    Charwidth.normalize("｢ﾊﾛｰﾜｰﾙﾄﾞ｣") # => "「ハローワールド」"

Or extend String class.

    require "charwidth/string"
    "Ｈｅｌｌｏ，　Ｗｏｒｌｄ！".normalize_charwidth # => "Hello, World!"
    "Ｈｅｌｌｏ，　Ｗｏｒｌｄ！".normalize_charwidth! # => destructive
    "｢ﾊﾛｰﾜｰﾙﾄﾞ｣".normalize_charwidth # => "「ハローワールド」"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
