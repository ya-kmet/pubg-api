RSpec.describe Pubg::Api::HttpWrapper do
  describe '#get_request' do
    it 'sends a Get request' do
      response = {}
      allow(Pubg::Api::HttpWrapper).to receive(:get) { response }

      request_response = Pubg::Api::HttpWrapper.get_request(
        '/scope',
        { search: 'a' },
        api_key: 'api_key'
      )

      expect(Pubg::Api::HttpWrapper).to have_received(:get).with(
        '/scope',
        query: { search: 'a' },
        headers: {
          Accept: 'application/vnd.api+json',
          "Content-Type": 'application/json',
          "Accept-Encoding": 'gzip',
          Authorization: 'Bearer api_key'
        }
      )
      expect(request_response).to eq(response)
    end
  end
end
