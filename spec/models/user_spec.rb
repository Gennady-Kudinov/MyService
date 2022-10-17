require 'rails_helper'

RSpec.describe User, type: :model do
  before(:example) do 
    @user = create(:user) 
  end

  describe 'validates' do 
    context "when not valid without name" do 
      it 'get nil name' do 
        @user.name = nil 
        expect(@user).to_not be_valid 
      end
    end

    context 'when not valid without password' do 
      it 'get password nil' do 
        @user.password = nil #ожидаем что пользователь без пароля не пройдет 
        expect(@user).to_not be_valid 
      end
    end

    context 'when valid user' do 
      it { expect(@user).to be_valid }  
    end

  end   
end
