FactoryBot.define do
  factory :message do
    user { nil }
    chat { nil }
    content { "MyText" }
  end
end
