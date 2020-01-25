class LocationQuery
  def initialize(query)
    @query = query
  end

  def get_results
    results = Geocoder.search(@query)
    results[0..5]
  end
end
