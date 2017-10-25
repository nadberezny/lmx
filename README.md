# Lmx

Yet another simple DSL for building XML


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lmx'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lmx

## Usage

```ruby
xml_builder = Lmx::Builder.new

xml_builder.build do
  node_catalog do
    node_book id: 1 do
      node_author { content 'Hugo, Victor' }
    end
  end
end
# => "<catalog><book id=\"1\"><author>Hugo, Victor</author></book></catalog>"

```

or

```ruby
xml_builder = Lmx::Builder.new

xml_builder.build do
  node :catalog do
    node :book, id: 1 do
      node(:author) { content 'Hugo, Victor' }
    end
  end
end
# => "<catalog><book id=\"1\"><author>Hugo, Victor</author></book></catalog>"

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nadberezny/lmx.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

