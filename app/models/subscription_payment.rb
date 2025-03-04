class SubscriptionPayment < ApplicationRecord
  belongs_to :subscription

  validates :payment_method, :amount, presence: true
  validates :status, inclusion: { in: %w[pending paid failed refunded] }
end
