json.array!(@pois) do |poi|
  json.extract! poi, :name, :location, :description
  json.url poi_url(poi, format: :json)
end