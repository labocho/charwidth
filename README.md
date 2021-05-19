# charwidth

Normalize Unicode fullwidth / halfwidth (zenkaku / hankaku) characters.

# Installation

Add this line to your application's Gemfile:

    gem 'charwidth'


And then execute:

    $ bundle

Or install it yourself as:

    $ gem install charwidth

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

# Rails integration

Add lines below to `app/models/application_record.rb`.

    require "charwidth/active_model"
    class ApplicationRecord < ActiveRecord::Base
      include Charwidth::ActiveModel
    end

And call `normalize_charwidth` class method in model class.

    class Article < ActiveRecord::Base
      normalize_charwidth :title, :body
    end

    a = Article.new(title: "Ｈｅｌｌｏ，　Ｗｏｒｌｄ！")
    a.title # => "Hello, World!"

# CLI

    # Call charwidth command with arguments
    $ charwidth "Ｈｅｌｌｏ，　Ｗｏｒｌｄ！"
    Hello, World!
    # Or as STDIN
    $ echo "Ｈｅｌｌｏ，　Ｗｏｒｌｄ！" | charwidth
    Hello, World!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
