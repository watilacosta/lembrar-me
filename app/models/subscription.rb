class Subscription < ApplicationRecord
  belongs_to :user, foreign_key: :professional_id
  belongs_to :plan
  has_many :subscription_payments, dependent: :destroy

  validates :starts_at, :ends_at, :status, presence: true
  validates :status, inclusion: { in: %w[active canceled expired pending] }

  def expired? = ends_at < Time.current

  # def paid? = payments.where(status: "paid").exists?
end
