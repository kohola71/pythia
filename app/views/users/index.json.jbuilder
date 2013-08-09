json.array!(@users) do |user|
  json.extract! user, :name, :slug
  json.url user_url(user, format: :json)
end
