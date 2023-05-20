class SoftEcu < ApplicationRecord
    belongs_to :model_ecu, optional: true
    has_many :sw_idents
    validates :name, uniqueness: { scope: :model_ecu_id }
end
  