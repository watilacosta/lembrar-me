class CreateSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :schedules do |t|
      t.references :user, null: false, foreign_key: true # Professional
      t.datetime :available_at, null: false
      t.boolean :booked, default: false

      t.timestamps
    end
  end
end
