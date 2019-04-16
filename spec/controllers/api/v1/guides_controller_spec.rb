require 'rails_helper'
describe "Get all guides route", :type => :request do
	before(:each) do
		@guides = FactoryBot.create_list(:random_guide, 20)
	end
	
	before {get '/api/v1/guides'}

	it 'return all guides' do
		expect(JSON.parse(response.body).size).to eq(20)
	end

	it 'returns status code 200' do
		expect(response).to have_http_status(:success)
	end
end 