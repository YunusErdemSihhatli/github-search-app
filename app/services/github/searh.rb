module Github
  class Searh
    GITHUB_URL = 'https://api.github.com'.freeze

    def initialize(name:, options: {})
      @mame = name
      @options = options
    end

    def call
      request_params = {
        q: @mame,
        order: 'desc',
        page: @options[:page]
      }

      conn = Faraday.new(
        url: GITHUB_URL,
        params: request_params,
        headers: {
          'Authorization' => "Bearer #{ENV['GITHUB_TOKEN']}"
        }
      )
      res = conn.get('/search/repositories')

      puts res.body if res.is_a?(Net::HTTPSuccess)
      JSON.parse(res.body)
    end

  end
end