class Client < ApplicationRecord
    has_many :cars, dependent: :destroy
    has_one :order 


    
    def order? 
      self.order ? true : false 
    end
end

