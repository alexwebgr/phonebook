require 'rails_helper'

RSpec.describe 'Phonebook API', type: :request do
  let!(:user) { create(:user) }
  let!(:contacts) { create_list(:contact, 10, user_id: user.id) }
  let(:user_id) { user.id }
  let(:id) { contacts.first.id }

  # Test suite for GET /contacts
  describe 'GET /contacts' do
    # make HTTP get request before each example
    before { get '/contacts' }

    it 'returns contacts' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end