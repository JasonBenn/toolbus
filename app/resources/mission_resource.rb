class MissionResource < JSONAPI::Resource 
  attributes :name, :summary, :found_in, :documentation_url, :version_added, :version_removed, :version, :tool_id
end