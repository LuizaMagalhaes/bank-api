require 'rails_helper'

RSpec.describe 'GET account balance', type: :request do
  context 'when success' do
    it 'shows account balance' do
      account = Account.create(name: 'Harry Potter', balance: 90.0)
 
      get "/accounts/#{account.id}"
      
      body = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(body["account"]["name"]).to eq('Harry Potter')
      expect(body["account"]["balance"]).to eq("90.0")
    end
  end

  context 'when failure' do
    it 'shows error message' do 
      get "/accounts/1999"
      
      body = JSON.parse(response.body)
      expect(response.status).to eq(404)
      expect(body["error"]).to eq('Account not found')
    end
  end
end