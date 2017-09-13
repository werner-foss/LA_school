class Kid < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates_presence_of :title, :subtitle, :body
  
  mount_uploader :thumb_image, LanguageUploader
  mount_uploader :main_image, LanguageUploader
  
  def self.by_position
    order("position ASC")
  end
end
