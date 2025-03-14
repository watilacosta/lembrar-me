class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_many :subscription_payments, dependent: :destroy

  validates :starts_at, :ends_at, :status, presence: true
  validates :status, inclusion: { in: %w[active canceled expired pending] }
  validates :duration_in_days, presence: true, numericality: { greater_than: 0 }

  enum :status, {
    active: "active",
    canceled: "canceled",
    expired: "expired",
    pending: "pending"
  }

  def expired? = ends_at < Time.current

  def amount
    return plan.price unless duration_in_days.present?

    plan.price * (duration_in_days / 30)
  end
end
