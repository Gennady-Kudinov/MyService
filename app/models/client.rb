class Client < ApplicationRecord
    has_many :cars, dependent: :destroy
    has_many :orders

    
    def orders? 
       true if self.orders.present?   
    end
end

