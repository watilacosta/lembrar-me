class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.references :appointment, null: false, foreign_key: true
      t.string :status, default: 'pending'
      t.decimal :amount, precision: 10, scale: 2

      t.timestamps
    end
  end
end
