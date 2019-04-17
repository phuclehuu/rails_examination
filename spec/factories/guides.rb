FactoryBot.define do
  factory :guide do
    email {Faker::Internet.email}
    factory :random_guide do
  		after(:create) do |g|
  			create_list(:random_language, rand(1..2), guides: [g])
  			create_list(:random_activity, rand(1..2), guides: [g])
  		end
  	end
  end
end
