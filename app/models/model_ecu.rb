class ModelEcu < ApplicationRecord
  belongs_to :brand_ecu, optional: true
  has_many :soft_ecus
  validates :name, uniqueness: { scope: :brand_ecu_id }
end
