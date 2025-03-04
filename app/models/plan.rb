class Plan < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions

  validates :name, :price, :duration_in_days, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
