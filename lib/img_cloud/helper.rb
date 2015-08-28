module ImgCloudHelper
  
  def img_cloud_tag(img_path, height, width)
    "<img src=\"#{ImgCloud.transform_url(img_path, height, width)}\" height=\"#{height}\" width=\"#{width}\">"
  end	
end  