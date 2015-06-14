class UserResource < JSONAPI::Resource 
  attributes :username, :image_url
  
  has_many :repos
  has_many :completions
end