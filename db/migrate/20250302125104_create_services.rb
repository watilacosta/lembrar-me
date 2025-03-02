class CreateServices < ActiveRecord::Migration[8.0]
  def change
    create_table :services do |t|
      t.references :user, null: false, foreign_key: true # Professional
      t.string :title, null: false
      t.text :description
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
