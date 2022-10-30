class Chat < ApplicationRecord
  has_many :messages, dependent: :destroy

  validates :name, presence: true, uniqueness: true 
end
