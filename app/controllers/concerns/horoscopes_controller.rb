class HoroscopesController < ApplicationController
	before_action :all_signs, only: [:initialize, :show, :tomorrow, :yesterday, :like, :dislike]
	
	#======
	# GEMS
	#======
	require 'httparty'
	require 'twilio-ruby'
	#==================
	#Twilio Credentials
	#==================
	account_sid = ENV['TWILIO_ID']
	auth_token = ENV['TWILIO_AUTH']
	phone_number = ENV['TWILIO_NUMBER']

	#========
	# Index
	#========
	def index
		@horoscopes = Horoscope.all
	end
	#======================
	# Today's Horoscope
	#======================
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
	#======================
	# Tomorrow's Horoscope
	#======================
	def tomorrow
		@response = HTTParty.get('https://theastrologer-api.herokuapp.com/api/horoscope/' + @horoscope.name + '/tomorrow')
		@http_party_json = JSON.parse(@response.body)
		@parsed_horoscope = @http_party_json["horoscope"]
		@parsed_date = @http_party_json["date"]
		@parsed_intensity = @http_party_json["meta"]["intensity"]
		@parsed_mood = @http_party_json["meta"]["mood"]
		@parsed_keywords = @http_party_json["meta"]["keywords"]
	end
	#======================
	# Yesterday's Horoscope
	#======================
	def yesterday
		@response = HTTParty.get('https://theastrologer-api.herokuapp.com/api/horoscope/' + @horoscope.name + '/yesterday')
		@http_party_json = JSON.parse(@response.body)
		@parsed_horoscope = @http_party_json["horoscope"]
		@parsed_date = @http_party_json["date"]
		@parsed_intensity = @http_party_json["meta"]["intensity"]
		@parsed_mood = @http_party_json["meta"]["mood"]
		@parsed_keywords = @http_party_json["meta"]["keywords"]
	end
	#======================
	# Implementing Likes +1
	#======================
	def like
		@horoscope = Horoscope.find(params[:id])
		@horoscope.increment! :likes
		redirect_to @horoscope
	end
	#======================
	# Implementing Dislikes
	#======================
	def dislike
		@horoscope = Horoscope.find(params[:id])
		@horoscope.increment! :dislikes
		redirect_to @horoscope
	end
	#===============================
	# GET request for Action Mailer
	#===============================
	def email_form
	end
	#=====================================================
	# PUT request for Action Mailer + some actions for it
	#=====================================================
	def emailer
		@recipient = params[:email]
		puts @recipient
		LovelaceMailer.email(@recipient).deliver
		redirect_to action: 'index'
	end

	#============================
	#GET Request for Twilio form
	#============================
	def text_form
	end

	#=====================================================
	# PUT request for Twilio form + some actions for it
	#=====================================================
	def text	
		@to = params[:to]
		@body = params[:body]
		account_sid = ENV['TWILIO_ID']
		auth_token = ENV['TWILIO_AUTH']
		phone_number = ENV['TWILIO_NUMBER']
		@client = Twilio::REST::Client.new account_sid, auth_token
		@client.messages.create(
			from: phone_number,
			to: @to,
			body: @body
		)
		redirect_to action: 'index'
	end

	private
	#====================================================
	# Allowing params to be accessible thru before_action
	#====================================================
	def all_signs
		@horoscope = Horoscope.find(params[:id])
	end
	#======================================================
	# Permiting likes & dislikes to access horoscope params
	#======================================================
	def horoscope_params
		params.require(:horoscope).permit(:likes, :dislikes)
	end
end