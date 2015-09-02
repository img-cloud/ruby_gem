module ImgCloud
	class Configuration
		attr_accessor :base_uri, :apiKey

		def initialize
			@base_uri = 'http://img-cloud.liftoffllc.in/'
			@upload_endpoint = '/upload'
		end
	end
end