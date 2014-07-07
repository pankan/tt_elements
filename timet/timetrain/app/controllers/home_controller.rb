class HomeController < ApplicationController

  def timeline
    @member = current_member
    
  end
	
  def index
  	if current_member
  		redirect_to members_timeline_path
  	else
  		redirect_to member_session_path
  	end
  end

  def connect_twitter
	auth = request.env["omniauth.auth"]
	current_member.twitter_id = auth["uid"]
	current_member.save
	TwitterModel.store_urls(auth,current_member)
	redirect_to members_social_sign_up_path
  end

  def connect_gplus
	auth = request.env["omniauth.auth"]
	current_member.gplus_id = auth["uid"]
	current_member.save
	Googleplus.store_urls(auth.credentials.token,current_member.gplus_id,current_member )
	redirect_to members_social_sign_up_path	
  end

end