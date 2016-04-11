json.array!(@ideas) do |idea|
  json.extract! idea, :id, :name, :overview, :skills, :additional_information, :platform, :help_needed
  json.url idea_url(idea, format: :json)
end
