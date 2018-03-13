
module Pubg
  module Api
    class Matches < HttpWrapper
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
      DEFAULT_LIMIT = 5
      DEFAULT_ORDER = 'asc'.freeze

      ORDERS = {
        asc: 'createdAt',
        desc: '-createdAt'
      }.freeze

      def next
        next_match_opts = opts.dup
        next_match_opts[:offest] = offset + 1
        Matches.new(opts).request
      end

      private

      attr_reader :opts

      def path
        "shards/#{region}/matches"
      end

      def query
        {
          page: { offset: offset, limit: limit },
          sort: order,
          filter: {
            'createdAt-start' => filter_start,
            'createdAt-end' => filter_end,
            'playerIds' => player_ids,
            'gameMode' => game_mode
          }
        }
      end

      def offset
        opts[:offset] || 1
      end

      def limit
        opts[:limit] || DEFAULT_LIMIT
      end

      def order
        ORDERS[opts[:order] || DEFAULT_ORDER]
      end

      def filter_start
        opts[:start]
      end

      def filter_end
        opts[:end]
      end

      def filter_player_ids
        opts[:player_ids]
      end

      def filter_game_mode
        opts[:game_mode]
      end

      def region
        opts[:region] || DEFAULT_REGION
      end
    end
  end
end
