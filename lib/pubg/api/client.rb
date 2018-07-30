
module Pubg
  module Api
    class Client
      attr_reader :api_key

      def initialize(api_key)
        @api_key = api_key
      end

      def status
        Status.new(self)
      end

      def matches(opts = {})
        Matches.new(self, opts)
      end

      def players(opts = {})
        Players.new(self, opts)
      end

      def match(match_id)
        Match.new(self, match_id: match_id)
      end

      def telemetry(path)
        Telemetry.new(self, path: path)
      end
    end
  end
end
