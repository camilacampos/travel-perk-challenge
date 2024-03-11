class HttpRequest
  def initialize(access_token:, http_client: Typhoeus::Request, base_path: "")
    @http_client = http_client
    @base_path = base_path
    @access_token = access_token
  end

  def get(path, params = {})
    @http_client.get(
      "#{@base_path}/#{path}",
      params:,
      headers: authorization_headers
    )
  end

  private

  def authorization_headers
    {"Authorization" => @access_token}
  end
end
