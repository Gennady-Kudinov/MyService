require 'rails_helper'

RSpec.describe Order, type: :model do

  before(:example) do 
    @order = create(:order) 
  end

  describe "validates" do 

    context "when order not valid" do 

      it "get empty problem" do 
        @order.problem = ''  
        expect(@order).to_not be_valid 
      end 

      it "get empty description" do 
        @order.work_description =  ''
        expect(@order).to_not be_valid 
      end

      it "get zero price" do 
        @order.price = 0 
        expect(@order).to_not be_valid
      end
      
      it "get mileage less or eq 0" do 
        @order.mileage = 0 
        expect(@order).to_not be_valid 
      end
        
    end

    context 'when valid order' do 
      it { expect(@order).to be_valid  }
    end
  end

end
