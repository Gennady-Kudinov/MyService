class Order < ApplicationRecord
  validates :problem, presence: true  
  belongs_to :client

  mount_uploader :image, ImageUploader
end
