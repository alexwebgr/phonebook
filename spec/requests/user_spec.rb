require 'rails_helper'

RSpec.describe 'Phonebook API', type: :request do
  describe 'GET /users' do
    before { get '/users' }

    it 'should not allow to list the users' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json['message']).to eql('Missing token')
    end

    it 'returns status code 401 unauthorized_request' do
      expect(response).to have_http_status(401)
    end
  end
end