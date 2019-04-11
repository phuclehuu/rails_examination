languages = [1, 2, 3, 4]
activities = [1, 2, 3, 4, 5]
1000.times do
	Guide.seed do |s|
		s.email = Faker::Internet.email
		s.language_ids = languages.sample(1 + rand(languages.count))
		s.activity_ids = activities.sample(1 + rand(activities.count))
	end
end