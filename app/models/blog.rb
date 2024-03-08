class Blog < ApplicationRecord
  include Rails.application.routes.url_helpers

  # active storage 
  has_one_attached :cover_image

  has_and_belongs_to_many :categories
  belongs_to :user
  
  validates :title, presence: true
  validates :content, presence: true

  def cover_image_url 
      # localhost:3000/image.png
      rails_blob_url(self.cover_image, only_path: false) if self.cover_image.attached?
  end
end