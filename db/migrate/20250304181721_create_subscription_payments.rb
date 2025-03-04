class CreateSubscriptionPayments < ActiveRecord::Migration[8.0]
  def change
    create_table :subscription_payments do |t|
      t.references :subscription, null: false, foreign_key: true
      t.string :payment_method, null: false # credit_card, boleto, pix
      t.string :transaction_id # ID da transação no gateway de pagamento
      t.string :status, default: "pending"
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.string :paid_at

      t.timestamps
    end
  end
end
