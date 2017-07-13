class Adult < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates_presence_of :title, :subtitle, :body, :main_image, :thumb_image
  scope :general_course, ->{ where(subtitle:'General Course') }
  scope :business_course, ->{ where(subtitle:'Business Course') }
  scope :specialized_course, ->{ where(subtitle:'Specialized Course') }
end
