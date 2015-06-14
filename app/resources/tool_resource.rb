class ToolResource < JSONAPI::Resource
  attributes :name, :primary_color, :secondary_color, :description, :url
  
  has_many :missions
  has_many :repos
end