class Order < ApplicationRecord
  validates :problem, presence: true  
  validates :mileage,  numericality: { greater_than: 100 }

  belongs_to :client

  mount_uploader :image, ImageUploader
  validates :image, file_size: { less_than: 1.megabytes }
end
