require 'rails_helper'

RSpec.describe Client, type: :model do

  before(:example) do 
    @client = create(:client)
  end

  describe "validates" do 

    context "when client is not valid" do 

      it "get licence nil" do 
        @client.licence = nil
        expect(@client).to_not be_valid 
      end 

      it "get phone nil" do 
        @client.phone = nil 
        expect(@client).to_not be_valid 
      end

      it "get date nil" do 
        @client.data = nil 
        expect(@client).to_not be_valid 
      end

      it "get length licence != 10" do 
        @client.licence = 12345678910
        expect(@client).to_not be_valid
      end

    end 

    context "when client is valid" do 

      it "get phone as string" do 
        expect(@client.phone).to be_an_instance_of(String) #является экземпляром String 
      end

      it  "get length licence = 10" do 
        expect(@client.licence.length).to eq(10)
      end

      context "when client is valid" do 
        it { expect(@client).to be_valid  }
      end

    end
  end  

end
