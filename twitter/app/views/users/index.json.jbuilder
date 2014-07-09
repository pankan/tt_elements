json.array!(@users) do |user|
  json.extract! user, :id, :name, :access_token, :access_secret
  json.url user_url(user, format: :json)
end
