FactoryBot.define do
  factory :guide do
    email { "joe@gmail.com" }
  end

  factory :random_guide, class: Guide do
  	email {Faker::Internet.email}
  end
end
