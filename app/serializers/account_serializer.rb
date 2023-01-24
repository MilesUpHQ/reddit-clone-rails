class AccountSerializer
  include JSONAPI::Serializer
  attributes :id, :first_name, :last_name, :username, :bio, :email, :created_at
end
