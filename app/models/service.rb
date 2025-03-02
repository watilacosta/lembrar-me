class Service < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy

  validates :title, :description, :price, presence: true
end
