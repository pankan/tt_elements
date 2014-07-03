class HomeController < ApplicationController

	def timeline
	end
	
	def index
	end

	def connect_twitter
		auth = request.env["omniauth.auth"]
		current_member.twitter_id = auth["uid"]
		current_member.save
		redirect_to members_timeline
		
	end






end
