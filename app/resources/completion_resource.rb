class CompletionResource < JSONAPI::Resource 
  attributes :commit, :filename, :line_start, :line_end, :gist_url
  
  has_one :user
  has_one :repo
  has_one :mission
end