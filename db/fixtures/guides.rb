Guide.seed do |s|
  s.id = 1
  s.email = "nguyen@vn.com"
  s.language_ids = [1, 3]
  s.activity_ids = [1, 5]
end

Guide.seed do |s|
  s.id = 2
  s.email = "phan@vn.com"
  s.language_ids = [1]
  s.activity_ids = [1, 5, 4]
end