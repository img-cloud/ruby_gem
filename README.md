# ImgCloud

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/img_cloud`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

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

ImgCloud.configure do |config|
  config.base_uri = 'http://img-cloud.liftoffllc.in/'     #optional
  config.apiKey = 'f837dje0-4c99-11e5-a2ca-27ben7f17568'   #required
end

The methods are as follows:

ImgCloud.upload   # parameters => path(required), tags (optional, comma separated string) & folder (optional )

ImgCloud.transform    #parameters image_path(required, from the upload response), options(hash, height & width)

helper method : 
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/img_cloud/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

