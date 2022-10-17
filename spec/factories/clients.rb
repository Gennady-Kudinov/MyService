FactoryBot.define do
  factory :client do
    licence { Faker::Number.number(digits: 10)  } 
    phone { Faker::PhoneNumber.cell_phone_with_country_code } 
    data { Date.new }    
  end
end
