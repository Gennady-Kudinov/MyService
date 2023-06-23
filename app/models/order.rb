class Order < ApplicationRecord
  validates :problem, presence: true  
  validates :mileage,  numericality: { greater_than_or_equal_to: 0 }

  belongs_to :client
  belongs_to :car, optional: true

  has_many_attached :files, dependent: :destroy
  has_many_attached :images, dependent: :destroy
end
