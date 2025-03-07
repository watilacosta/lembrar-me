class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_many :subscription_payments, dependent: :destroy

  validates :starts_at, :ends_at, :status, presence: true
  validates :status, inclusion: { in: %w[active canceled expired pending] }

  enum :status, {
    active: "active",
    canceled: "canceled",
    expired: "expired",
    pending: "pending"
  }

  def expired? = ends_at < Time.current
end
