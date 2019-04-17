FactoryBot.define do
  factory :language do
    code { "es" }
  end

  factory :random_language, class: Language do
  	code {Faker::Lorem.characters(5)}
  	guides {[association(:guide)]}
  end
end
