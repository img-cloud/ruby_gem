require "img_cloud/version"
require "img_cloud/configuration"
require 'net/http/post/multipart'
#require 'net/http'
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
  # def self.sign_up(email, firstname, lastname, company, password)
  #   params = {'email' => email, 'firstName' => firstname, 'lastName' => lastname, 'company' => company, 'password' => password}
  #   json_headers = {"Content-Type" => "application/json",
  #               "Accept" => "application/json"}
  #   uri = URI.parse('http://img-cloud.herokuapp.com/users')
  #   http = Net::HTTP.new(uri.host, uri.port)
  #   res = http.post(uri.path, params.to_json, json_headers)
		# res.body
  # end
  
  def self.upload(path, tags, folder)
    uri = URI.parse("#{ImgCloud.configuration.base_uri}/upload")
    req = Net::HTTP::Post::Multipart.new uri.path,
          "image" => UploadIO.new(File.new(path), "image/jpg", "image.jpg"),
          "tags" => tags, "apiKey" => ImgCloud.configuration.apiKey, "folder" => folder

    res = Net::HTTP.start(uri.host, uri.port) do |http|
      http.request(req)
    end
  end
    
  def self.transform(image_path, options = {})
    uri = URI.parse(transform_url(image_path, options))
    http = Net::HTTP.new(uri.host, uri.port)
    http.get(uri.path)
  end

  def self.transform_url(image_path, options = {})
    transform_args = []
    
    transform_args << "h_#{options[:height]}" if options[:height].present? && (options[:height].to_i > 0)
    transform_args << "w_#{options[:width]}"  if options[:width].present? && (options[:width].to_i > 0)

    args = transform_args.join(',')

    parts = image_path.rpartition('/')

    if args.blank?
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
