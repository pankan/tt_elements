json.array!(@users) do |user|
  json.extract! user, :id, :name, :provider, :oauth_token, :activity_list, :temp
  json.url user_url(user, format: :json)
end
