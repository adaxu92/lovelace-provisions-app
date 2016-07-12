class Sign < ActiveRecord::Base
	validates :name, presence: true
	validates :img_url, presence: true
end