module ImgCloudHelper
  
  def img_cloud_tag(img_path, options = {})
  	height = "height=\"#{options[:height]}\"" if options[:height].present? && (options[:height].to_i > 0)
  	width = "width=\"#{options[:width]}\"" if options[:width].present? && (options[:width].to_i > 0)
    "<img src=\"#{ImgCloud.transform_url(img_path, options)}\" #{height} #{width}>"
  end	
end  