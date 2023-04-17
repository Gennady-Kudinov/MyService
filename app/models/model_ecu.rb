class ModelEcu < ApplicationRecord
  belongs_to :brand_ecu, optional: true
  has_many :soft_ecus
end
