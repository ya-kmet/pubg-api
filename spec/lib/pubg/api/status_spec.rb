RSpec.describe Pubg::Api::Status do
  describe '#body' do
    it 'returns a body of /status request' do
      client = Pubg::Api::Client.new('api-key')

      VCR.use_cassette('status') do
        status = Pubg::Api::Status.new(client)
        expect(status.body).to eq(
          'data' => {
            'type' => 'status',
            'id' => 'pubg-api',
            'attributes' => {
              'released_at' => '2018-03-12T14:08:16Z',
              'version' => 'master'
            }
          }
        )
      end
    end
  end
end
