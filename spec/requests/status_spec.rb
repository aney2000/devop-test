# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'The Status', type: :request do
  subject(:status) { get '/status' }

  context 'when the database is reachable' do
    it 'responds with an ok status' do
      status

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to eq(
        { 'status' => 'ok', 'database' => 'connected' }
      )
    end
  end
end
