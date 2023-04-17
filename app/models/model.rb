class Model < ApplicationRecord
  belongs_to :make
  has_many :model_ecus
end
