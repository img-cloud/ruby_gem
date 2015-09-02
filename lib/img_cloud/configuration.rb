module ImgCloud
	class Configuration
		attr_accessor :base_uri, :apiKey, :upload_endpoint

		def initialize
			@base_uri = 'http://imgcloud.liftoffllc.in'
			@upload_endpoint = '/upload'
		end
	end
end