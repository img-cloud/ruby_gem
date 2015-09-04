module ImgCloud
	class Configuration
		attr_accessor :base_uri, :apiKey, :upload_endpoint

		def initialize
			@base_uri = 'http://www.imgcloud.io'
			@upload_endpoint = '/upload'
		end
	end
end