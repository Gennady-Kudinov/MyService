class Car < ApplicationRecord
  belongs_to :model
  belongs_to :make
  belongs_to :client
  belongs_to :brand_ecu, optional: true 
  belongs_to :model_ecu, optional: true
  belongs_to :soft_ecu, optional: true
  belongs_to :sw_ident, optional: true

  attribute :works, :string
  attribute :programm, :string
  attribute :mileage_km, :string
  attribute :diagnose, :string
  attribute :model_ecu, :string
end
