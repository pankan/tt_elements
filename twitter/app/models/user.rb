class User < ActiveRecord::Base
def User
  attr_accessible :identifier,:tweet_message,:arr
end

def self.create_with_omniauth(auth)
    create! do |user|
      user.access_token = auth["credentials"]["token"]
      user.access_secret = auth["credentials"]["secret"]
      user.name = auth["info"]["name"]
    end
end

def tweet(message)
  client = Twitter::REST::Client.new do |config|
  config.consumer_key        = 'KFmY7FZfHs4nPCsuerXj61isy'
  config.consumer_secret     = 'K3z9WkgHN2uAbppe7MaYRyyLJf1lCVHWHPtVpEtyyCSJFpYCHb'
  config.access_token        = access_token
  config.access_token_secret = access_secret
end
#if message
	arr = client.user_timeline 
#else
#	client.update(":(")
#end
arr.map do |ab|
	ab = ab.text
end
# arr = client.status(arr)

end

end