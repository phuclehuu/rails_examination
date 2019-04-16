json.array!(@guides) do |guide|
	json.email guide.email
	json.languages guide.languages
	json.activities guide.activities
	json.review_url guide_reviews_path(guide.id)
end