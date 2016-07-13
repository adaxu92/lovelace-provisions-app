class HoroscopesController < ApplicationController
	before_action :all_signs, only: [:show]
	def index
		@horoscopes = Horoscope.all

	end

	def show
		@horoscope = Horoscope.find(params[:id])
		puts '=============='
		puts request
	end

	private
	def all_signs
		@horoscope = Horoscope.find(params[:id])
	end
end