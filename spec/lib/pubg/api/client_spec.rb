RSpec.describe Pubg::Api::Client do
  describe '#status' do
    it 'returns an instance of Status request' do
      client = Pubg::Api::Client.new('api_key')

      expect(client.status).to be_kind_of(Pubg::Api::Status)
    end
  end

  describe '#matches' do
    it 'returns an instance of Matches request' do
      client = Pubg::Api::Client.new('api_key')

      expect(client.matches).to be_kind_of(Pubg::Api::Matches)
    end
  end

  describe '#match' do
    it 'returns an instance of Match request' do
      client = Pubg::Api::Client.new('api_key')

      expect(client.match('match-id')).to be_kind_of(Pubg::Api::Match)
    end
  end

  describe '#telemetry' do
    it 'returns an instance of Telemetry request' do
      client = Pubg::Api::Client.new('api_key')

      expect(client.telemetry('a-path')).to be_kind_of(Pubg::Api::Telemetry)
    end
  end
end
