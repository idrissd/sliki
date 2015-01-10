json.array!(@kinds) do |kind|
  json.extract! kind, :id, :thing_id, :name, :values
  json.url kind_url(kind, format: :json)
end
