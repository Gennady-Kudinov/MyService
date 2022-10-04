class Car < ApplicationRecord
  belongs_to :model
  belongs_to :make

  belongs_to :ecm, optional: true 
  belongs_to :client

  attribute :works, :string
  attribute :programm, :string
  attribute :mileage_km, :string
  attribute :diagnose, :string
end
