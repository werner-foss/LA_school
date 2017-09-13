module AdultsHelper
  def image_generator(height:, width:)
   "http://placehold.it/#{height}x#{width}"
  end
  
  def adults_img img, type
    if img.model.main_image? || img.model.thumb_image?
      img
    elsif type == 'thumb'
      image_generator(height:'350', width:'150')
    else
      image_generator(height:'450', width:'250')
    end
  end
end

