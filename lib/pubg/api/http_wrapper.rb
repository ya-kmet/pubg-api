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

      def initialize(client, opts = {})
        @client = client
        @opts = opts
      end

      def request
        @request ||= self.class.get(path, query: query, headers: headers)
      end

      def body
        request.parsed_response
      end

      def query
        {}
      end

      private

      attr_reader :client

      def path
        '/'
      end

      def headers
        @headers ||= { :Authorization => "Bearer #{@client.api_key}" }.merge(self.class.headers)
      end
    end
  end
end
