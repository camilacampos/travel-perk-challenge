class GetClosestVenue
  def initialize(venue_api = Foursquare::Api.new)
    @venue_api = venue_api
  end

  def call(latitude:, longitude:)
    ordered_venues.first
  end

  def ordered_venues(latitude:, longitude:)
    response = @venue_api.search_venues(latitude: latitude, longitude: longitude)
    order_venues(response["results"], latitude, longitude)
  end

  private

  def order_venues(venues_response, latitude, longitude)
    venues_response.sort_by do |venue|
      coordinates = venue["geocodes"]["main"]
      distance_to(latitude, longitude, coordinates)
    end
  end

  def distance_to(latitude, longitude, coordinates)
    Math.sqrt(
      (coordinates["latitude"].to_f - latitude.to_f)**2 +
      (coordinates["longitude"].to_f - longitude.to_f)**2
    )
  end
end
