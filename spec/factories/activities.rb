FactoryBot.define do
  factory :activity do
    name { "cooking" }
  end

  factory :random_activity, class: Activity do
  	name {Faker::Lorem.characters(10)}
  	guides {[association(:guide)]}
  end
end
