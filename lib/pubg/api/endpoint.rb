module Pubg
  module Api
    class Endpoint
      def initialize(client, opts = {})
        @client = client
        @opts = opts
      end

      def response
        @response ||= HttpWrapper.get_request(path, query, request_opts)
      end

      def body
        response.parsed_response
      end

      private

      attr_reader :client, :opts

      def request_opts
        {
          api_key: client.api_key
        }
      end

      def path
        '/'
      end

      def query
        {}
      end
    end
  end
end
