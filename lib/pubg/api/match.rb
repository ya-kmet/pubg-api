
module Pubg
  module Api
    class Match < HttpWrapper
      DEFAULT_REGION = 'pc-eu'.freeze

      private

      attr_reader :opts

      def path
        "shards/#{region}/matches/#{match_id}"
      end

      def region
        opts[:region] || DEFAULT_REGION
      end

      def match_id
        opts.fetch(:match_id)
      end
    end
  end
end
