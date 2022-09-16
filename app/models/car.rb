class Car < ApplicationRecord
  belongs_to :model
  belongs_to :make

  belongs_to :ecm
  belongs_to :client
end
