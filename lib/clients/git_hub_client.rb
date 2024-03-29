class GitHubClient
  #ROOT_ENDPOINT = "https://api.github.com"

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.create_gist(params.to_json)
  end

  def status
    @http_client.last_response.status
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'] )
  end

end
