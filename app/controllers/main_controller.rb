class MainController < ApplicationController
	
	before_action :force_json, only: [:search, :languages_no_one_speaks]
	
	def index; end

	def search
		@guides = GuideService.new(params).search
	end

	def languages_no_one_speaks
		@languages = LanguageService.new.get_unused_languages
	end

	private
	def force_json
		request.format = :json
	end

end