require "ruby_img_cloud/version"
require 'net/http/post/multipart'
#require 'net/http'
require 'json'

module RubyImgCloud
  # def self.sign_up(email, firstname, lastname, company, password)
  #   params = {'email' => email, 'firstName' => firstname, 'lastName' => lastname, 'company' => company, 'password' => password}
  #   json_headers = {"Content-Type" => "application/json",
  #               "Accept" => "application/json"}
  #   uri = URI.parse('http://img-cloud.herokuapp.com/users')
  #   http = Net::HTTP.new(uri.host, uri.port)
  #   res = http.post(uri.path, params.to_json, json_headers)
		# res.body
  # end
  
  def self.upload(path, tags, apiKey, folder)
    uri = URI.parse('http://img-cloud.herokuapp.com/upload')
    req = Net::HTTP::Post::Multipart.new uri.path,
          "image" => UploadIO.new(File.new(path), "image/jpg", "image.jpg"),
          "tags" => tags, "apiKey" => apiKey, "folder" => folder

    res = Net::HTTP.start(uri.host, uri.port) do |http|
      http.request(req)
    end
  end
    
  def self.transform(height, width, image_url)
    transform_args = "h_#{height},w_#{width}"
    parts = image_url.rpartition('/')
    parts[1] = transform_args

    uri = URI.parse(parts.join('/'))
    http = Net::HTTP.new(uri.host, uri.port)
    res = http.get(uri.path)
    #res.body
  end

  def self.transform_url(height, width, image_url)
    transform_args = "h_#{height},w_#{width}"
    parts = image_url.rpartition('/')
    parts[1] = transform_args

    parts.join('/')
  end
end

require "ruby_img_cloud/helper" if defined?(::ActionView::Base)
require "ruby_img_cloud/railtie" if defined?(Rails) && defined?(Rails::Railtie)
