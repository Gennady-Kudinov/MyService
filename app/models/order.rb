class Order < ApplicationRecord
  validates :problem, :work_description, :price, presence: true  
  belongs_to :client
end
