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
  end 

  context 'failure' do
    it 'should have a destination account' do
      @transference.account_source_id = @account1.id
      @transference.account_destination_id = nil

      expect(@transference).not_to be_valid
    end
  end
end
