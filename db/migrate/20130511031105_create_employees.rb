class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :phone
      t.decimal :salary
      t.string :email
      t.integer :department_id
      t.string :password

      t.timestamps
    end
  end
end
