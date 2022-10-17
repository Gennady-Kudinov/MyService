FactoryBot.define do
  factory :order do
    problem { Faker::Lorem.characters(number: 15) } 
    work_description { Faker::Lorem.characters(number: 30)  }
    price { Faker::Number.number(digits: 4) }
    mileage { Faker::Number.number(digits: 6)  }
    association :client 
  end
end
