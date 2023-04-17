class SoftEcu < ApplicationRecord
    belongs_to :model_ecu, optional: true
end
  