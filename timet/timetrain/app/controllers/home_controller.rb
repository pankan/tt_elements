class HomeController < ApplicationController

  def timeline
  end
	
  def index
  end

  def connect_twitter
	auth = request.env["omniauth.auth"]
	current_member.twitter_id = auth["uid"]
	current_member.save
	TwitterModel.store_urls(auth,current_member)
	redirect_to members_timeline_path	
  end

  def connect_gplus
	auth = request.env["omniauth.auth"]
	current_member.gplus_id = auth["uid"]
	current_member.save
	Googleplus.store_urls(auth.credentials.token,current_member.gplus_id,current_member )
	redirect_to members_timeline_path	
  end

end