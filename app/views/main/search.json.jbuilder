json.guides do
	json.array!(@guides) do |guide|
		json.email guide.email
		json.languages guide.languages
		json.activities guide.activities
	end
end