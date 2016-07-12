# class TestsController < ApplicationController
# 	include HTTParty
	
# 	base_uri 'https://theastrologer-api.herokuapp.com/api/horoscope'

# 	attr_accessor :sign_data, :date_date

# 	def initialize(sign_data, date_data)
# 		self.sign_data = sign_data
# 		self.date_data = date_data 
# 	end

# 	def self.find(sign_data, date_data)
# 		response = get("/#{sign_data}/#{date_data}")
# 		if response.success?
# 			puts response
# 		else 
# 			puts response.code
# 		end
# 	end
# end
	#***********************
	# Status 200 
	#***********************
	# require 'httparty'
	# response = HTTParty.get('https://theastrologer-api.herokuapp.com/api/horoscope/sagittarius/today')
	# 	def test
	# 	puts '=====RESPONSE========='
	# 	puts response
	# 	puts '=======RESPONSE CLASS=========='
	# 	puts response.class
	# 	puts '====RESPONSE BODY============='
	# 	puts response.body
	# 	puts '=====RESPONSE CODE============'
	# 	puts response.code
	# 	puts '======RESPONSE MESSAGE==========='
	# 	puts response.message
	# 	puts '=======RESPONSE HEADERS=========='
	# 	puts response.headers
	# 	puts '================='
	# end	


	# attr_accessor :sign_data, :date_date

	# def initialize(sign_data, date_data)
	# 	self.sign_data = sign_data
	# 	self.date_data = date_data 
	# end

	# def self.find(sign_data, date_data)
	# 	response = get("/#{sign_data}/#{date_data}")

	#***********************
	#Status 500 - Depricated
	#***********************
	# require 'httparty'
	# response = HTTParty.get('https://theastrologer-api.herokuapp.com/api/horoscope', 
	# 	:headers => { "sign_data" => "sagittarius", "date_data" => "today"})

	# def test
	# 	puts '=====RESPONSE========='
	# 	puts response
	# 	puts '=======RESPONSE CLASS=========='
	# 	puts response.class
	# 	puts '====RESPONSE BODY============='
	# 	puts response.body
	# 	puts '=====RESPONSE CODE============'
	# 	puts response.code
	# 	puts '======RESPONSE MESSAGE==========='
	# 	puts response.message
	# 	puts '=======RESPONSE HEADERS=========='
	# 	puts response.headers
	# 	puts '================='
	# end