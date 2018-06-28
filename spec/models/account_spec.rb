require 'rails_helper'

RSpec.describe Account do
  it 'should have many transferences' do 
    account = Account.new(name: 'Harry Potter', balance: 90.0)
    expect(account.transferences).to eq([])
  end

  describe '#credit' do
    it 'amount should be added to balance' do
      account = Account.new(name: 'Hermione Granger', balance: 0.0)
      account.credit(100.0)
      expect(account.balance).to eq(100.0)
    end
  end

  describe '#debit' do
    it 'amount should be debited from balance' do
      account = Account.new(name: 'Hermione Granger', balance: 100.0)
      account.debit(10.0)
      expect(account.balance).to eq(90.0)
    end
  end
end
