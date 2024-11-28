# app/serializers/user_serializer.rb

class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :bio, :status, :role, :city, :country, :skills, :user_attributes, :interests, :languages, :website, :social_links, :company, :job_title
end
