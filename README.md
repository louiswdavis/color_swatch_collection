# ColorSwatchCollection

![Gem Version](https://badge.fury.io/rb/color_swatch_collection.svg)
[![Static Badge](https://img.shields.io/badge/RubyGems-red)](https://rubygems.org/gems/color_swatch_collection)

> Find a colour swatch from various collections.

ColorSwatchCollection is a ruby gem package for use in ruby or other projects that provides colour swatches with their name and hex code from various collections. You can find colour swatches by providing either the name or hex code you want to search against. You can also query collection colour lists directly.

## Lists

The colour collections:

- [roygbiv](lib/color_namer_rails/roygbiv.rb)
- [basic](lib/color_namer_rails/basic.rb)
- [html](lib/color_namer_rails/html.rb) - the HTML color names.
- [x11](lib/color_namer_rails/x11.rb) - The list that preceded the HTML color names
- [pantone](lib/color_namer_rails/pantone.rb)
- [ntc](lib/color_namer_rails/ntc.rb), an [astounding collection](http://chir.ag/projects/ntc/) of over 1500 named colors.
- [tailwind](https://tailwindcss.com/) [v1](https://v1.tailwindcss.com/docs/customizing-colors#default-color-palette), [v2](https://v2.tailwindcss.com/docs/customizing-colors), [v3](https://v3.tailwindcss.com/docs/customizing-colors), and [v4](https://tailwindcss.com/docs/colors)

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add color_swatch_collection
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install color_swatch_collection
```

## Usage

## Methods

```ruby
ColorSwatchCollection.list_collections
=> ['basic', 'html', 'ntc', 'pantone', 'roygbiv', 'x11', 'tailwind_v1', 'tailwind_v2', 'tailwind_v3', 'tailwind_v4']
```

```ruby
ColorSwatchCollection.get_from_hex('#FDBCB4')
=> { name: 'melon', hex: '#FDBCB4', collection: 'pantone' }
```

```ruby
ColorSwatchCollection.get_from_name('navajo white')
=> { name: 'navajowhite', hex: '#FFDEAD', collection: 'html' }
```

```ruby
ColorSwatchCollection.get_colours
=> [
=>   { collection: 'basic', hex: '#000000', name: 'black' },
=>   { collection: 'basic', hex: '#0000FF', name: 'blue' },
=>   .
=>   .
=>   .
=> ]
```

## Options

### pick

This parameter allows you to filter names from the dedicated lists for faster computation.
It can be used for `get_from_hex`, `get_from_name`, or `get_colours`.

```ruby
ColorSwatchCollection.get_from_hex('#00FF00', pick: ['html', 'pantone'])
ColorSwatchCollection.get_from_name('blue', pick: ['x11'])
ColorSwatchCollection.get_colours(pick: ['basic'])
```

### omit

The opposite of `options.pick` and when used alongside the `pick` option the `omit` option has precedence.
It can be used for `get_from_hex`, `get_from_name`, or `get_colours`.

```ruby
ColorSwatchCollection.get_from_hex('#00FF00', omit: ['html', 'pantone'])
ColorSwatchCollection.get_from_name('blue', omit: ['ntc'])
ColorSwatchCollection.get_colours(omit: ['ntc', 'basic'])
```

## Configuration

Create an initializer file to allow you to set the collections you want to always pick or omit rather than having to set them each time you call a method:

```ruby
# config/initializers/color_swatch_collection.rb

ColorSwatchCollection.configure do |config|
  config.default_collection_picks = ['x11', 'css']
  config.default_collection_omits = ['pantone']
end
```

There are reader and resetter methods that can be called to view the current configuration and to reset the values

```ruby
ColorSwatchCollection.configuration
=> <ColorSwatchCollection::Configuration @default_collection_omits=["pantone"], @default_collection_picks=["x11", "css"]>

ColorSwatchCollection.reset_configuration!
=> <ColorSwatchCollection::Configuration @default_collection_omits=[], @default_collection_picks=[]>
```

These defaults can be overridden if `pick` or `omit` are called explicitly in a method, as shown in the `Options` section.
To unset them in a way that provides the default behaviour, all collections in `pick` and no collection in `omit`, pass '[]'.

```ruby
ColorSwatchCollection.get_from_hex('#00FF00', pick: ['[]]'])
ColorSwatchCollection.get_from_hex('#00FF00', omit: ['[]]'])
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/louiswdavis/color_swatch_collection>. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/louiswdavis/color_swatch_collection/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ColorSwatchCollection project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/louiswdavis/color_swatch_collection/blob/master/CODE_OF_CONDUCT.md).
