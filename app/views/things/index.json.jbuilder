json.array!(@things) do |thing|
  json.extract! thing, :id, :topic_id, :name, :color, :position, :x, :y
  json.url thing_url(thing, format: :json)
end
