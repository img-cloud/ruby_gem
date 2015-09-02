module ImgCloudHelper
	# displays a transformed image, accepts a relative image path and height width parameters. Additional parameters if any are ignored,
	# and the original image is displayed if no or invalid height width parameters are provided.

  # Example
  #
  #     img_cloud_tag "/ic_4e1756/1440667545769_1436524274_car1.jpg", :width=>100, :height=>100

	def img_cloud_tag(img_path, options = {})
		height = "height=\"#{options[:height]}\"" if (options[:height].to_i > 0)
		width = "width=\"#{options[:width]}\"" if (options[:width].to_i > 0)
		"<img src=\"#{ImgCloud.request_url(img_path, options)}\" #{height} #{width}>"
	end	
end  