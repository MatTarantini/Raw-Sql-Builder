# RawSqlBuilder

This gem is to ease the pain of mass creating and updating object attributes in your database.
It will adapt to different tables, columns, and column-types.
Dramatically speeds up the creating or updating of large groups of objects.

Loops through all objects passed and will build/execute raw SQL mass create or update queries.

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

Pass through a collection or array of objects to one of the methods below.
Will also accept a single object.

- Creating:
  - Use the method 'new' to create new objects without saving them to the database.
  - Once all objects have attributes assigned, pass them through to mass_create or
    mass_create_or_update to be created.
  
- Updating:
  - Assign attributes to objects, I prefer using the method 'assign_attributes.'
  - Once all attributes are assigned for all objects pass them through to mass_update or
    mass_create_or_update for updating.
  
- Methods:
  - mass_create(objects)
    - This will only do a creation query and include objects that return true on 'new_record?'
    - Any existing objects that have updated attributes and were passed through will be ignored.
  - mass_update(objects)
    - Will only update existing objects and ignore new objects.
  - mass_create_or_update(objects)
    - Will separate new objects and updated objects, then run respective queries.
  - execute(query)
    - Will execute the query you pass through.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/raw_sql_builder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
