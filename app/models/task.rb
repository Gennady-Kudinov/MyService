class Task < ApplicationRecord

  validates :name, :description, presence: true 
  belongs_to :user 
  
  scope :ordered, -> { order(date: :asc)  }
end
