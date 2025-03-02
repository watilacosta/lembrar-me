class Schedule < ApplicationRecord
  belongs_to :user

  validates :available_at, presence: true
end
