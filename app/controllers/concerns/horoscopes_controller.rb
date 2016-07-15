class HoroscopesController < ApplicationController
	before_action :all_signs, only: [:initialize, :show, :tomorrow, :yesterday]
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
		@parsed_keywords = @http_party_json["meta"]["keywords"]
	end

	def tomorrow
		@response = HTTParty.get('https://theastrologer-api.herokuapp.com/api/horoscope/' + @horoscope.name + '/tomorrow')
		@http_party_json = JSON.parse(@response.body)
		@parsed_horoscope = @http_party_json["horoscope"]
		@parsed_date = @http_party_json["date"]
		@parsed_intensity = @http_party_json["meta"]["intensity"]
		@parsed_mood = @http_party_json["meta"]["mood"]
		@parsed_keywords = @http_party_json["meta"]["keywords"]
	end

	def yesterday
		@response = HTTParty.get('https://theastrologer-api.herokuapp.com/api/horoscope/' + @horoscope.name + '/yesterday')
		@http_party_json = JSON.parse(@response.body)
		@parsed_horoscope = @http_party_json["horoscope"]
		@parsed_date = @http_party_json["date"]
		@parsed_intensity = @http_party_json["meta"]["intensity"]
		@parsed_mood = @http_party_json["meta"]["mood"]
		@parsed_keywords = @http_party_json["meta"]["keywords"]
	end

	private
	def all_signs
		@horoscope = Horoscope.find(params[:id])
	end
end