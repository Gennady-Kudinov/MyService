class Client < ApplicationRecord
    has_many :cars, dependent: :destroy
    has_many :orders, dependent: :destroy 
    
    validates :licence, :phone, :data, presence: true  
    validates :licence, length: { in: 9..10  }
    
    def orders? 
       true if self.orders.present?   
    end
end

