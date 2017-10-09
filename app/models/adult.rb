class Adult < ApplicationRecord
  has_many :courses, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :courses, allow_destroy: true, reject_if: lambda {|attrs| attrs['name'].blank?}
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates_presence_of :title, :subtitle, :body
  
  mount_uploader :thumb_image, LanguageUploader
  mount_uploader :main_image, LanguageUploader

  def self.by_position
    order("position ASC")
  end
end