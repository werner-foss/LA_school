class News < ApplicationRecord
  include Placeholder
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates_presence_of :title, :subtitle, :body, :small_image
  
  mount_uploader :small_image, LanguageUploader
  
  after_initialize :set_defaults
  
  def set_defaults
    self.small_image ||= Placeholder.image_generator(height:'350', width:'150')
  end
end
