FactoryBot.define do
  factory :review do
    score { 3 }
    comment { "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ullamcorper odio lorem, id molestie magna rutrum in." }
    guide {association(:guide)}
  end
end
