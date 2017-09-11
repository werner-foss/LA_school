class Adult < ApplicationRecord
  has_many :courses, dependent: :destroy
  accepts_nested_attributes_for :courses, allow_destroy: true, reject_if: lambda {|attrs| attrs['name'].blank?}
  include Placeholder
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates_presence_of :title, :subtitle, :body, :main_image, :thumb_image
  
  mount_uploader :thumb_image, LanguageUploader
  mount_uploader :main_image, LanguageUploader
  
  after_initialize :set_defaults
  
  def set_defaults
    self.main_image ||= Placeholder.image_generator(height:'350', width:'150')
    self.thumb_image ||= Placeholder.image_generator(height:'50', width:'50')
  end
  
  def self.by_position
    order("position ASC")
  end
end
