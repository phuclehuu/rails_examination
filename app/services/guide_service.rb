class GuideService
	def initialize(params)
		languages_request = params[:l] == nil ? '' : params[:l].tr(' ','');
		activities_request = params[:a] == nil ? '' : params[:a].tr(' ','');
		@language_codes = languages_request.split(',');
		@activity_names = activities_request.split(',');

		language_count = @language_codes.count == 0 ? 1 : @language_codes.count;
		activity_count = @activity_names.count == 0 ? 1 : @activity_names.count;

		# The number of records when we pick up a guide who can speak N languages and conduct M activities
		# It's a combinatorics of (N x M)
		@length_cond = language_count * activity_count;
	end
	def search
		Guide.ransack({languages_code_in: @language_codes, activities_name_in: @activity_names}).result()
			.having('count(guides.id) >= ?', @length_cond).group('guides.id')
			.includes(:languages, :activities).limit(100);
	end
	def all
		Guide.ransack().result()
			.includes(:languages, :activities);
	end
end