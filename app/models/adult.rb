class Adult < ApplicationRecord
  has_many :courses, dependent: :destroy
  include Placeholder
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates_presence_of :title, :subtitle, :body, :main_image, :thumb_image
  scope :general_course, ->{ where(subtitle:'General Course') }
  scope :business_course, ->{ where(subtitle:'Business Course') }
  scope :specialized_course, ->{ where(subtitle:'Specialized Course') }
  
  after_initialize :set_defaults
  
  def set_defaults
    self.main_image ||= Placeholder.image_generator(height:'350', width:'150')
    self.thumb_image ||= Placeholder.image_generator(height:'50', width:'50')
  end
end
