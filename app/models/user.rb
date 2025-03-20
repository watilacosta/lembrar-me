class User < ApplicationRecord
  # Include default users modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { client: 0, professional: 1, admin: 3 }

  has_many :services, foreign_key: :user_id, dependent: :destroy
  has_many :appointments, foreign_key: :client_id, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :plans, through: :subscriptions

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  def has_active_subscription? = subscriptions.exists?(status: "active")

  def active_subscription = subscriptions.find_by(status: "active")
end
