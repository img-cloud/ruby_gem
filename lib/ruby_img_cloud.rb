require "ruby_img_cloud/version"
require 'net/http/post/multipart'
#require 'net/http'
require 'json'

module RubyImgCloud
  def self.sign_up(email, firstname, lastname, company, password)
    params = {'email' => email, 'firstName' => firstname, 'lastName' => lastname, 'company' => company, 'password' => password}
    json_headers = {"Content-Type" => "application/json",
                "Accept" => "application/json"}
    uri = URI.parse('http://localhost:3000/users')
    http = Net::HTTP.new(uri.host, uri.port)
    res = http.post(uri.path, params.to_json, json_headers)
		res.body
  end
  
  def self.upload(path, tags, apiKey)
    json_headers = {"Content-Type" => "application/json",
                "Accept" => "application/json"}
    uri = URI.parse('http://localhost:3000/upload')
    req = Net::HTTP::Post::Multipart.new uri.path,
          "file" => UploadIO.new(File.new(path), "image/jpg", "image.jpg"),
          "tags" => tags, "apiKey" => apiKey
    # http = Net::HTTP.new(uri.host, uri.port)
    # res = http.post(uri.path, params.to_json, json_headers)
    # res.body
    res = Net::HTTP.start(uri.host, uri.port) do |http|
      http.request(req, json_headers)
    end
  end
    
  def self.transform
    params = {'q' => 'ruby', 'max' => '50'}
    json_headers = {"Content-Type" => "application/json",
                "Accept" => "application/json"}
    uri = URI.parse('http://localhost:3000/users')
    http = Net::HTTP.new(uri.host, uri.port)
    res = http.post(uri.path, params.to_json, json_headers)
    res.body
  end
end
