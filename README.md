# RawSqlBuilder

To Use:
  Pass through a collection or array of objects

Raw Sql Rules:
  Keys being assigned to can be without quotes or surrounded by double quotes
  Double quotes are recommended to prevent a column name from being confused
    with an action. Ex: column name "order"
  Values being assigned must be surrounded by single quotes

  Hashes:
    No exterior curly braces
    A hash within the value of another hash must be surrounded by double quotes
    Interior hash quotes must be escaped double quotes
    Interior hash must use : not =>

    Ex: '"main"=>"{\"key\":\"value\"}"'

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'raw_sql_builder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install raw_sql_builder

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/raw_sql_builder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
