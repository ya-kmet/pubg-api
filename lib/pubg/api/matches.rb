
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

      GAME_MODS = %w[
        solo
        duo
        squad
      ].freeze

      DEFAULT_REGION = 'pc-eu'.freeze
      DEFAULT_LIMIT = 5
      DEFAULT_ORDER = 'asc'.freeze

      ORDERS = {
        asc: 'createdAt',
        desc: '-createdAt'
      }.freeze

      def next
        page(offset + 1)
      end

      def prev
        page(offset - 1)
      end

      private

      attr_reader :opts

      def page(new_offset)
        matches_opts = opts.dup
        matches_opts[:offset] = new_offset
        Matches.new(client, matches_opts)
      end

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
            'playerIds' => filter_player_ids,
            'gameMode' => filter_game_mode
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
        opts[:start]&.iso8601
      end

      def filter_end
        opts[:end]&.iso8601
      end

      def filter_player_ids
        opts[:player_ids]&.join(',')
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
