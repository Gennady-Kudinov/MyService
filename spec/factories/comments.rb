FactoryBot.define do
  factory :comment do
    image { nil }
    author { "MyString" }
    body { "MyText" }
    articles { nil }
  end
end
