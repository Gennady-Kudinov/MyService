class Chat < ApplicationRecord
  has_many :messages 

  validates :name, presence: true, uniqueness: true 
end
