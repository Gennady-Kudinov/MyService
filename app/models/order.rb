class Order < ApplicationRecord
  validates :problem, presence: true  
  belongs_to :client

  mount_uploader :image, ImageUploader
  validates :image, file_size: { less_than: 1.megabytes }
end
