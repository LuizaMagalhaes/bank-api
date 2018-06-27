require 'rails_helper'

RSpec.describe 'Create account', type: :request do
  it 'creates a new account' do
    params = {
      account: {
        name: 'Harry Potter',
        balance: 20.0
      }
    }

    post '/accounts', params: params

    expect(response.status).to eq(201)
  end
end
