require 'httparty'
require 'plissken'

module Pubg
  module Api
    class HttpWrapper
      include HTTParty

      base_uri 'https://api.playbattlegrounds.com/'.freeze
      headers \
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/json',
        'Accept-Encoding': 'gzip'

      parser(
        proc do |body, _format|
          JSON.parse(body).to_snake_keys
        end
      )

      debug_output if ENV['DEBUG_PUBG_API']

      def self.get_request(path, query = {}, opts = {})
        get(path,
            query: query,
            headers: headers.merge(Authorization: "Bearer #{opts.fetch(:api_key)}"))
      end
    end
  end
end
