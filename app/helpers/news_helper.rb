module NewsHelper
  def image_generator(height:, width:)
   "http://placehold.it/#{height}x#{width}"
  end
  
  def news_img img
    if img.model.small_image?
      img
    else
      image_generator(height:'350', width:'150')
    end
  end
end
