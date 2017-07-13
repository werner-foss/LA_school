class Kid < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates_presence_of :title, :subtitle, :body, :main_image, :thumb_image
  
  after_initialize :set_defaults
  
  def set_defaults
    self.main_image ||= "https://placeholdit.imgix.net/~text?txtsize=33&txt=350%C3%97150&w=350&h=150"
    self.thumb_image ||= "https://placeholdit.imgix.net/~text?txtsize=6&txt=50%C3%9750&w=50&h=50"
  end
end
