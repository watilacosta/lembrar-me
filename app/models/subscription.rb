class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_many :subscription_payments, dependent: :destroy

  validates :starts_at, :ends_at, :status, presence: true
  validates :status, inclusion: { in: %w[active canceled expired pending] }
  validates :duration_in_days,
            presence: { message: "Campo obrigatório. Escolha uma vigência do plano" },
            numericality: { greater_than: 0 }

  EXTRA_DURATION_IN_DAYS = 7.days

  accepts_nested_attributes_for :user, update_only: true

  before_validation :set_ends_at, on: :create

  enum :status, {
    active: "active",
    canceled: "canceled",
    expired: "expired",
    pending: "pending"
  }

  scope :except_canceled, -> { where.not(status: "canceled") }

  def amount
    return plan.price unless duration_in_days.present?

    plan.price * (duration_in_days / 30)
  end

  def set_ends_at
    return if duration_in_days.blank?

    self.ends_at = starts_at + duration_in_days.days + EXTRA_DURATION_IN_DAYS
  end

  def toggle_active!
    if active?
      update!(status: "pending")
    else
      update!(status: "active")
    end
  end
end
