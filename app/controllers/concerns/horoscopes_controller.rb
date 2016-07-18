class HoroscopesController < ApplicationController
	before_action :all_signs, only: [:initialize, :show, :tomorrow, :yesterday, :like, :dislike]
	require 'httparty'

	def index
		@horoscopes = Horoscope.all
	end

	def show
		puts @horoscope.likes
		puts @horoscope.dislikes
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

	def like
		@horoscope = Horoscope.find(params[:id])
		@horoscope.increment! :likes
		redirect_to @horoscope
	end

	def dislike
		@horoscope = Horoscope.find(params[:id])
		@horoscope.increment! :dislikes
		redirect_to @horoscope
	end

	def email_form
	end

	def emailer
		@recipient = params[:email]
		puts @recipient
		LovelaceMailer.email(@recipient).deliver
		redirect_to action: 'index'
	end


	private
	def all_signs
		@horoscope = Horoscope.find(params[:id])
	end

	def horoscope_params
		params.require(:horoscope).permit(:likes, :dislikes)
	end
end