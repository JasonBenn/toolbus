class RepoResource < JSONAPI::Resource 
  attributes :name
  
  has_many :users
  has_many :tools
  has_many :completions
end