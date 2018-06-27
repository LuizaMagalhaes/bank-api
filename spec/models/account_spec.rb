require 'rails_helper'

RSpec.describe Account, type: :model do
  before(:each) do
    @account1 = Account.create(name: 'Harry Potter', balance: 90.0)
    @account2 = Account.create(name: 'Hermione Granger', balance: 180.0)
    @transference = Transference.new(amount: 10.0, account_source_id: @account1.id, account_destination_id: @account2.id)
  end
  
  context 'sucess' do
    it 'transference should create a debit(10.0) from source account && create a credit(10.0) to destination account' do
        
    @account1.balance = 10.0
    @account2.balance = 0.0

    @account1.debit(@transference.amount.to_f)
    @account2.credit(@transference.amount.to_f)

    @account1.save
    @account2.save

    expect(@account1.balance.to_f).to eq 0.0
    expect(@account2.balance.to_f).to eq 10.0
    end
  end
end