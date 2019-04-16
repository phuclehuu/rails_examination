class Api::V1::GuidesController < ApplicationController
	before_action :force_json, only: [:index]
	def index
		@guides = GuideService.new(params).all
	end

	private
	def force_json
      request.format = :json
    end
end
