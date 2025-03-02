class Payment < ApplicationRecord
  belongs_to :appointment

  validates :amount, :status, presence: true

  enum :status, { pending: "pending", paid:  "paid", failed: "failed" }
end
