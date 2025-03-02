class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments do |t|
      t.references :service, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: { to_table: :users }
      t.datetime :scheduled_at, null: false
      t.integer :status, default: 0 # 0 = Pending, 1 = Confirmed, 2 = Canceled

      t.timestamps
    end
  end
end
