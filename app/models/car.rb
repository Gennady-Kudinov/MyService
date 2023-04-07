class Car < ApplicationRecord
  belongs_to :model
  belongs_to :make

  belongs_to :ecm, optional: true 
  belongs_to :client

  belongs_to :brand_ecu
  belongs_to :model_ecu

  attribute :works, :string
  attribute :programm, :string
  attribute :mileage_km, :string
  attribute :diagnose, :string
  # attribute :brand_ecu_id
  # attribute :model_ecu_id
end
