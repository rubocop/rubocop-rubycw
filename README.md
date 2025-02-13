# RuboCop Rubycw

Integrate RuboCop and `ruby -cw`.

You can get Ruby's warning as a RuboCop offense by rubocop-rubycw.

## Requirements

* Ruby 2.7 or greater.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubocop-rubycw', require: false
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rubocop-rubycw

## Usage

Put this into your `.rubocop.yml`.

```yaml
plugins: rubocop-rubycw
```

> [!NOTE]
> The plugin system is supported in RuboCop 1.72+. In earlier versions, use `require` instead of `plugins`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rubocop/rubocop-rubycw.
