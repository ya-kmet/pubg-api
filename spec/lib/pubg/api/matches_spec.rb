RSpec.describe Pubg::Api::Matches do
  describe 'const REGIONS' do
    it {
      expect(Pubg::Api::Matches::REGIONS).to match_array(%w[
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
                                                         ])
    }
  end

  describe 'const GAME_MODES' do
    it { expect(Pubg::Api::Matches::GAME_MODS).to match_array(%w[solo duo squad]) }
  end

  describe 'const DEFAULT_REGION' do
    it { expect(Pubg::Api::Matches::DEFAULT_REGION).to eq('pc-eu') }
  end

  describe 'const DEFAULT_LIMIT' do
    it { expect(Pubg::Api::Matches::DEFAULT_LIMIT).to eq(5) }
  end

  describe 'const DEFAULT_ORDER' do
    it { expect(Pubg::Api::Matches::DEFAULT_ORDER).to eq('asc') }
  end

  describe 'const ORDERS' do
    it { expect(Pubg::Api::Matches::ORDERS).to eq(asc: 'createdAt', desc: '-createdAt') }
  end

  describe '#next' do
    it 'returns an instancec of Matches for the next page' do
      client = Pubg::Api::Client.new('api-key')
      matches = Pubg::Api::Matches.new(client, offset: 5)
      allow(Pubg::Api::Matches).to receive(:new)

      matches.next

      expect(Pubg::Api::Matches).to have_received(:new).with(client, offset: 6)
    end
  end

  describe '#prev' do
    it 'returns an instancec of Matches for the previou page' do
      client = Pubg::Api::Client.new('api-key')
      matches = Pubg::Api::Matches.new(client, offset: 5)
      allow(Pubg::Api::Matches).to receive(:new)

      matches.prev

      expect(Pubg::Api::Matches).to have_received(:new).with(client, offset: 4)
    end
  end

  describe '#request' do
    it 'sends a request to PUBG API' do
      client = Pubg::Api::Client.new('api-key')
      matches = Pubg::Api::Matches.new(client,
                                       offset: 1,
                                       limit: 2,
                                       order: :desc,
                                       start: Time.new(2018, 3, 20, 14, 30, 0, 0),
                                       end: Time.new(2018, 3, 20, 18, 30, 0, 0),
                                       player_ids: ['player-1_id', 'player-2_id'],
                                       game_mode: 'squad')

      allow(Pubg::Api::HttpWrapper).to receive(:get_request)
      matches.response

      expect(Pubg::Api::HttpWrapper).to \
        have_received(:get_request).
        with(
          '/shards/pc-eu/matches',
          {
            page: { offset: 1, limit: 2 },
            sort: '-createdAt',
            filter: {
              'createdAt-start' => '2018-03-20T14:30:00+00:00',
              'createdAt-end' => '2018-03-20T18:30:00+00:00',
              'playerIds' => 'player-1_id,player-2_id',
              'gameMode' => 'squad'
            }
          },
          api_key: 'api-key'
        )
    end
  end
end
