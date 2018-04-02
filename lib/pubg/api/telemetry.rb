module Pubg
  module Api
    class Telemetry < Endpoint
      # base_uri 'https://telemetry-cdn.playbattlegrounds.com/'.freeze

      private

      attr_reader :opts

      def path
        opts[:path]
      end
    end
  end
end
