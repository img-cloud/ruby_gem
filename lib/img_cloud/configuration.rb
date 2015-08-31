module ImgCloud
  class Configuration
  	attr_accessor :base_uri, :apiKey

  	def initialize
      @base_uri = 'http://img-cloud.liftoffllc.in/'
      #@apiKey = 'f8341be0-4c99-11e5-a2ca-27be34e17568'
    end
  end
end