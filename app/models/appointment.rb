class Appointment < ApplicationRecord
  belongs_to :service
  belongs_to :client, class_name: "User"
  has_one :payment, dependent: :destroy

  enum :status, { pending: 0, confirmed: 1, cancelled: 2 }

  validates :scheduled_at, presence: true
end
