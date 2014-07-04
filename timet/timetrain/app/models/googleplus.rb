class Googleplus < ActiveRecord::Base
  belongs_to :member

  def self.store_urls(token,gplus_id,user)
	GooglePlus.access_token = token
   	person = GooglePlus::Person.get(gplus_id,:access_token => token) 
	gplus_activity = person.list_activities
	gplus_activity.each do |item|
	  @gplus_user = Googleplus.new  			
	  @gplus_user.member = user
	  @gplus_user.post_link = item.url.to_s
	  @gplus_user.create_date = item.published
	  @gplus_user.save
 	end
 
  end
end
