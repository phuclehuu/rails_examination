class MainController < ApplicationController
	
	before_action :force_json, only: :search
	
	def index; end

	def search
		@guides = GuideService.new(params).search
	end

	private
	def force_json
		request.format = :json
	end

end