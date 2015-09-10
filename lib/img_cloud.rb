require "img_cloud/version"
require "img_cloud/configuration"
require 'net/http/post/multipart'
require 'json'

module ImgCloud

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end
 
  # Uploads the image, returns the image url and tags and folder in json format
  # accepts image path as required parameter, and tags ( comma separated string ), folder ( string ) as optional parameters
  def self.upload(path, tags, folder)
    uri = URI.parse("#{ImgCloud.configuration.base_uri}#{ImgCloud.configuration.upload_endpoint}")
    req = Net::HTTP::Post::Multipart.new uri.path,
          "image" => UploadIO.new(File.new(path), "image/jpg", path.split('/').last),
          "tags" => tags, "apiKey" => ImgCloud.configuration.apiKey, "folder" => folder

    res = Net::HTTP.start(uri.host, uri.port) do |http|
      http.request(req)
    end
  end
  
  # return the image as byte data,
  # accepts a relative image path and height width parameters.
  def self.transform(image_path, options = {})
    uri = URI.parse(request_url(image_path, options))
    http = Net::HTTP.new(uri.host, uri.port)
    http.get(uri.path)
  end

  # returns image url for img_cloud_tag helper
  # accepts a relative image path and height width parameters.
  def self.request_url(image_path, options = {})
    transform_args = []
    
    transform_args << "h_#{options[:height]}" if (options[:height].to_i > 0)
    transform_args << "w_#{options[:width]}"  if (options[:width].to_i > 0)
    transform_args << "blur_#{options[:blur]}" if (options[:blur].to_i > 0)
    transform_args << "sepia" if options[:sepia]
    transform_args << "crop" if options[:crop]
    transform_args << "scale" if options[:scale]
    transform_args << "grayscale" if options[:grayscale]
    if (options[:borderWidth].to_i > 0) or options[:borderColor]
      transform_args << "bdr_#{options[:borderWidth]}-#{options[:borderColor]}"
    end  

    args = transform_args.join(',')

    parts = image_path.rpartition('/')

    if args.empty?
      parts.delete_at(1)
    else  
      parts[1] = args
    end
    ImgCloud.configuration.base_uri + parts.join('/')
  end

  def self.configure
    yield(configuration)
  end
end

require "img_cloud/helper" if defined?(::ActionView::Base)
require "img_cloud/railtie" if defined?(Rails) && defined?(Rails::Railtie)
