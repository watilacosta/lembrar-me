class Plan < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions

  validates :name, :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :stripe_product_id, uniqueness: true, allow_nil: true

  before_save :convert_features_to_json

  def count_active_users
    users.count
  end

  # Getter
  def features_list
    features.is_a?(Hash) ? features.values.join(",") : ""
  end

  # Setter
  def features_list=(value)
    self.features = value.split(",")
                         .map(&:strip)
                         .each_with_index.to_h { |v, i| [ i.to_s, v ] }
  end

  private

  def convert_features_to_json
    self.features ||= {}
  end
end
