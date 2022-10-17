FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name  }
    password { Faker::Internet.password }
    admin { false  }    
  end
end
