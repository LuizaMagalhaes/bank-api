class Transference < ApplicationRecord
  validates :account_source_id, :account_destination_id, presence: true
  validates :amount, presence: true


  belongs_to :account_source, class_name: 'Account'
  belongs_to :account_destination, class_name: 'Account'
  before_save :transfer

  def transfer(amount)

    account_source.debit(amount)
    account_destination.credit(amount)
  end

  def transference_allowed?
    errors.add(:amount, 'Negative value') if amount.try(:negative?)
    errors.add(:balance, 'Insuficient funds') if balance.try(:negative?)
  end
end
