module RubyImgCloudHelper
  
  def img_cloud_tag(img_url, height, width)
    "<img src=\"#{RubyImgCloud.transform_url(height, width, img_url)}\" height=\"#{height}\" width=\"#{width}\">"
  end	
end  