json.array!(@users) do |user|
  json.extract! user, :id, :email, :name, :password_digest, :account_id
  json.url user_url(user, format: :json)
end
