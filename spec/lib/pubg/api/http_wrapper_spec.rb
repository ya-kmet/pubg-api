RSpec.describe Pubg::Api::HttpWrapper do
  describe '#request' do
    it 'sends a Get request' do
      client = Pubg::Api::Client.new('api_key')

      allow(Pubg::Api::HttpWrapper).to receive(:get)
      http_wrapper = Pubg::Api::HttpWrapper.new(client)

      http_wrapper.request

      expect(Pubg::Api::HttpWrapper).to \
        have_received(:get).
        with(
          '/',
          query: {},
          headers: {
            :Authorization => 'Bearer api_key',
            :Accept => 'application/vnd.api+json',
            :'Content-Type' => 'application/json',
            :'Accept-Encoding' => 'gzip'
          }
        )
    end
  end

  describe '#body' do
    it 'returns request body' do
      client = Pubg::Api::Client.new('api_key')

      response_body = double(:response_body, parsed_response: 'parsed_response')
      allow(Pubg::Api::HttpWrapper).to receive(:get) { response_body }
      http_wrapper = Pubg::Api::HttpWrapper.new(client)

      expect(http_wrapper.body).to eq('parsed_response')
    end
  end

  describe '#query' do
    it 'returns an empty hash' do
      client = Pubg::Api::Client.new('api_key')

      http_wrapper = Pubg::Api::HttpWrapper.new(client)

      expect(http_wrapper.query).to eq({})
    end
  end
end
