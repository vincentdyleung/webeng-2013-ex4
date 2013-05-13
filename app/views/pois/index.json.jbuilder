json.array!(@pois) do |poi|
  json.extract! poi, :name, :location, :description, :vote
  json.url poi_url(poi, format: :json)
end