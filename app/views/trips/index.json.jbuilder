json.array!(@trips) do |trip|
  json.extract! trip, :start_date, :end_date, :city
  json.url trip_url(trip, format: :json)
end