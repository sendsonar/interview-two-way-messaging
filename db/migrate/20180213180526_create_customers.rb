class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :username
      t.string :phone_number

      t.timestamps
    end
  end
end
