json.users @users do |user|
  json.extract! user, :id, :name, :created_at, :update_at
end
