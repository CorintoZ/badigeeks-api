class LocationQuery
  def initialize(query)
    @query = query
  end

  def get_results
    Geocoder.search(@query, params: { countrycodes: 'es' })
  end
end
