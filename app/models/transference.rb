class Transference < ApplicationRecord
  validates :account_source_id, :account_destination_id, :amount, presence: true
  validate :transference_allowed?
  belongs_to :account_source, class_name: 'Account'
  belongs_to :account_destination, class_name: 'Account'

  def transfer
    account_source_id.debit(amount)
    account_destination_id.credit(amount)
  end
  
  def transference_allowed?
    errors.add(:amount, 'Negative value') if amount.try(:negative?)
    errors.add(:balance, 'Insuficient funds') if balance.try(:negative?)
  end
end
