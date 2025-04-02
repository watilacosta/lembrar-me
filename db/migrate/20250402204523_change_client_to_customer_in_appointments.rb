class ChangeClientToCustomerInAppointments < ActiveRecord::Migration[8.0]
  def change
    remove_reference :appointments, :client, foreign_key: { to_table: :users }
    add_reference :appointments, :customer, foreign_key: true
  end
end
