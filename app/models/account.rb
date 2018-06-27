class Account < ApplicationRecord
  has_many :transferences

  def credit(amount)
    self.balance += amount
    self.save
  end

  def debit(amount)
    self.balance -= amount
    self.save
  end
end
