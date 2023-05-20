class SwIdent < ApplicationRecord
    belongs_to :soft_ecu, optional: true
    validates :name, uniqueness: { scope: :soft_ecu_id }

end
