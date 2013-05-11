class CreateEmployeeStaffMessages < ActiveRecord::Migration
  def change
    create_table :employee_staff_messages do |t|
      t.string :send_from
      t.string :send_to
      t.string :message
      t.boolean :deliver_status

      t.timestamps
    end
  end
end
