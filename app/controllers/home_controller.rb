class HomeController < ApplicationController
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	def index		
		@shrines = Shrine.all
		@client_ip = remote_ip()
	end
end
