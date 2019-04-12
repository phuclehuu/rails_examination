class LanguageService
	def initialize()
	end
	def get_unused_languages
		Language.ransack().result()
			.joins("LEFT OUTER JOIN guides_languages ON languages.id = guides_languages.language_id")
			.where('guides_languages.language_id is null');
	end
end