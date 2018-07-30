module Pubg
  module Api
    class Players < Endpoint
      REGIONS = %w[
        xbox-as
        xbox-eu
        xbox-na
        xbox-oc
        pc-krjp
        pc-na
        pc-eu
        pc-oc
        pc-kakao
        pc-sea
        pc-sa
        pc-as
      ].freeze

      DEFAULT_REGION = 'pc-eu'.freeze

      private

      attr_reader :opts

      def path
        "/shards/#{region}/players"
      end

      def query
        {
          filter: {
            'playerIds' => filter_player_ids,
            'playerNames' => filter_player_names
          }
        }
      end

      def filter_player_ids
        opts[:player_ids]&.join(',')
      end

      def filter_player_names
        opts[:player_names]&.join(',')
      end

      def region
        opts[:region] || DEFAULT_REGION
      end
    end
  end
end
