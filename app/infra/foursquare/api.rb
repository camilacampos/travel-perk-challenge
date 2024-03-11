module Foursquare
  class Api
    def initialize(http_request_class: HttpRequest)
      @http_request = http_request_class.new(
        access_token: ENV["FOURSQUARE_API_KEY"],
        base_path: "https://api.foursquare.com/v3"
      )
    end

    def search_venues(latitude:, longitude:, query: "")
      result = @http_request.get("places/search", {
        ll: "#{latitude},#{longitude}", query:
      })

      JSON.parse(result.body)
    end
  end
end
