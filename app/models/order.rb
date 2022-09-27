class Order < ApplicationRecord
  validates :problem, presence: true  
  belongs_to :client
end
