class Client < ApplicationRecord
    has_many :cars, dependent: :destroy
    has_one :order 
end

