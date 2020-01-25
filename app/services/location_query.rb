class LocationQuery
  def initialize(query)
    @query = query
  end

  def getResults
    results = Geocoder.search("Paris")
    results.first.coordinates
  end
end
