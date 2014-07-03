class User < ActiveRecord::Base

  def self.for_person(user_id, params = {})
    collection = params[:collection] || :public
    resource = "people/#{user_id}/activities/#{collection}"
    GooglePlus::Cursor.new(self, :get, resource, params)
  end


  def self.create_with_omniauth(auth)
      create! do |user|
    		user.provider = auth.provider
      	user.name = auth.info.name
     		user.oauth_token = auth.credentials.token
      	user.arr = auth.extra.raw_info.sub
       
      	
      	GooglePlus.access_token = user.oauth_token
      	person = GooglePlus::Person.get(user.arr , :access_token => user.oauth_token) 
  		user.activity_list = ''
  		gactivity = person.list_activities
  		gactivity.each do |item|
   			user.activity_list = user.activity_list + item.url + ","
  		end



      	user.save!
      end
  end
end
