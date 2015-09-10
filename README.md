# ImgCloud

ruby gem for img cloud. Uploading images will return image path that can be then used in a helper tag to transform images.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'img_cloud'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install img_cloud

## Usage
you can configure api key and base uri for the gem like this in an initializer

```ruby
ImgCloud.configure do |config|
  config.base_uri = 'http://www.imgcloud.io/'     #optional
  config.apiKey = 'f837dje0-4c99-11e5-a2ca-27ben7f17568'   #required
end
```

### Uploading an Image

```ruby
ImgCloud.upload(image_path, tags, folder)  # parameters => path(required), tags (optional, comma separated string) & folder (optional)
```

### Helper method for Image tag

```ruby
img_cloud_tag image_path, options
```

#### Options:

parameters                             | Type
---------------------------------------|------
height, width, borderWidth, blur       | Integer
borderColor, class, style, alt, title  | String
sepia, grayscale, crop, scale          | Boolean


#### Example:

```ruby
img_cloud_tag "/ic_4e1756/1440667545769_1436524274_car1.jpg", :width => 100, :height => 100, :sepia => true, :borderWidth => 5, :borderColor => 'red', :class => 'img_class', :style => "margin:10px"
```
displays a transformed image, accepts a relative image path and optional parameters.
If the parameters are incorrect, it is not applied to the image.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/img_cloud/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
