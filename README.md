# charwidth_normalization

charwidth_normalization is library to normalize Unicode fullwidth / halfwidth (zenkaku / hankaku) characters for Ruby.

# Installation

    gem install charwidth_normalization

# Usage

    require "charwidth_normalization"
    CharwidthNormalization.normalize("Ｈｅｌｌｏ，　Ｗｏｒｌｄ！") # => "Hello, World!"
    CharwidthNormalization.normalize!("Ｈｅｌｌｏ，　Ｗｏｒｌｄ！") # destructive
    CharwidthNormalization.normalize("｢ﾊﾛｰﾜｰﾙﾄﾞ｣") # => "「ハローワールド」"

Or extend String class.

    require "charwidth_normalization/string"
    "Ｈｅｌｌｏ，　Ｗｏｒｌｄ！".normalize_charwidth # => "Hello, World!"
    "Ｈｅｌｌｏ，　Ｗｏｒｌｄ！".normalize_charwidth! # => destructive
    "｢ﾊﾛｰﾜｰﾙﾄﾞ｣".normalize_charwidth # => "「ハローワールド」"
    
# Contributing to charwidth_normalization
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

# Copyright

Copyright (c) 2012 labocho. See LICENSE.txt for
further details.

