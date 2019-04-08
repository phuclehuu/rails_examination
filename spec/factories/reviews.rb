FactoryBot.define do
  factory :review do
    score { 1 }
    comment { "MyString" }
    guide { nil }
  end
end
