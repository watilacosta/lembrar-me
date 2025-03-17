class AddStripeIdProductToPlans < ActiveRecord::Migration[8.0]
  def change
    add_column :plans, :stripe_product_id, :string
  end
end
