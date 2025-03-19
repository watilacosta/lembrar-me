class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_many :subscription_payments, dependent: :destroy

  validates :starts_at, :ends_at, :status, presence: true
  validates :status, inclusion: { in: %w[active canceled expired pending] }
  validates :duration_in_days, presence: true, numericality: { greater_than: 0 }

  EXTRA_DURATION_IN_DAYS = 7.days

  accepts_nested_attributes_for :user, update_only: true

  before_validation :ends_at, on: :create

  enum :status, {
    active: "active",
    canceled: "canceled",
    expired: "expired",
    pending: "pending"
  }

  def amount
    return plan.price unless duration_in_days.present?

    plan.price * (duration_in_days / 30)
  end

  def ends_at
    self.ends_at = starts_at + duration_in_days.days + EXTRA_DURATION_IN_DAYS
  end
end
