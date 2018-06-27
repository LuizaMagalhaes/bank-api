require 'rails_helper'

RSpec.describe Transference, type: :model do
  before(:each) do
    @account1 = Account.create(name: 'Harry Potter', balance: 90.0)
    @account2 = Account.create(name: 'Hermione Granger', balance: 180.0)
    @transference = Transference.new(amount: 10.0, account_source_id: @account1.id, account_destination_id: @account2.id)
  end
  
  context 'success' do
    it 'transference should be valid' do
      expect(@transference).to be_valid
    end

    it 'transference should create a debit(10.0) from source account && create a credit(10.0) to destination account' do
      @account1.balance = 10.0
      @account2.balance = 0.0
      
      @account1.save
      @account2.save
      @transference.amount = 10.0
      @transference.save

      expect(@account1.reload.balance.to_f).to eq 0.0
      expect(@account2.reload.balance.to_f).to eq 10.0
    end
  end 

  context 'failure' do
    it 'should have a destination account' do
      @transference.account_source_id = @account1.id
      @transference.account_destination_id = nil

      expect(@transference).not_to be_valid
    end
  end
end
