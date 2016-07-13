class HoroscopesController < ApplicationController
	before_action :all_signs, only: [:initialize, :show]
	require 'httparty'

	def index
		@horoscopes = Horoscope.all
	end

	def show
		@response = HTTParty.get('https://theastrologer-api.herokuapp.com/api/horoscope/' + @horoscope.name + '/today')
		@http_party_json = JSON.parse(@response.body)
		@parsed_horoscope = @http_party_json["horoscope"]
		@parsed_date = @http_party_json["date"]
		@parsed_intensity = @http_party_json["meta"]["intensity"]
		@parsed_mood = @http_party_json["meta"]["mood"]
	end

	private
	def all_signs
		@horoscope = Horoscope.find(params[:id])
	end
end