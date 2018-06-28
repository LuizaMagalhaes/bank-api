class Transference < ApplicationRecord
  validates :account_source_id, :account_destination_id, :amount, presence: true
  belongs_to :account_source, class_name: 'Account'
  belongs_to :account_destination, class_name: 'Account'

  after_create :transfer
  
  def transfer
    account_source.debit(amount)
    account_destination.credit(amount)
  end

  def allow_transference?
    account_source.balance > amount
  end
end
