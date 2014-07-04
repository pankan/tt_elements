class MembersController < ApplicationController

def new
	@member= Member.new
end

def create
  @member = Member.new(member_params)
  if @member.save(member_params)
	redirect_to members_social_sign_up_path
  else
	redirect_to new_member_registration_path
  end
end

def social_sign_up
	
end

private
  def member_params
	params.require(:member).permit(:username, :email, :password, :password_confirmation)
  end

end