class HoroscopesController < ApplicationController
	before_action :all_signs, only: [:initialize, :show]
	require 'httparty'
	
	attr_accessor :sign_data

	def index
		@horoscopes = Horoscope.all
	end

	def show
		@response = HTTParty.get('https://theastrologer-api.herokuapp.com/api/horoscope/' + @horoscope.name + '/today').parsed_response
		respond_to do |format|
			format.json { render :json => JSON.parse(@result) }
			format.html { render "show.html.erb" }
		end
		puts '=====RESPONSE========='
		puts @response
	end

	private
	def all_signs
		@horoscope = Horoscope.find(params[:id])
	end
end