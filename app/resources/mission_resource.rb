class MissionResource < JSONAPI::Resource 
  attributes :name, :summary, :found_in, :documentation_url, :version_added, :version_removed, :version
  
  has_one :tool
  has_many :completions
end