class Order < ApplicationRecord
  validates :problem, presence: true  
  validates :mileage,  numericality: { greater_than_or_equal_to: 0 }

  belongs_to :client

  mount_uploader :image, ImageUploader
  validates :image, file_size: { less_than: 1.megabytes }
  # serialize :images, JSON

end
