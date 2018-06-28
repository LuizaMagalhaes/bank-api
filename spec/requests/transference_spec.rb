require 'rails_helper'

RSpec.describe 'POST transference', type: :request do
  context 'when success' do 
    it 'do tranference between accounts' do
      account1 = Account.create(name: 'Harry Potter', balance: 90.0)
      account2 = Account.create(name: 'Hermione Granger', balance: 100.0)
      
      transference_params = { 
        transference: {
          amount: 10.0,
          account_source_id: account1.id,
          account_destination_id: account2.id
        }
      }

      post "/transferences",   params: transference_params

      
      expect(response.status).to eq(201)
      expect(account1.reload.balance).to eq(80.0)
      expect(account2.reload.balance).to eq(110.0)            
    end
  end

  context 'when failure' do 
    it 'should get error when amount > balance' do
      account1 = Account.create(name: 'Harry Potter', balance: 50.0)
      account2 = Account.create(name: 'Hermione Granger', balance: 100.0)
      
      transference_params = { 
        transference: {
          amount: 60.0,
          account_source_id: account1.id,
          account_destination_id: account2.id
        }
      }

      post "/transferences",   params: transference_params

      expect(response.status).to eq(422)
      expect(account1.reload.balance).to eq(50.0)
      expect(account2.reload.balance).to eq(100.0)  
    end
  end
end
