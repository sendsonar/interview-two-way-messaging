class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :text
      t.references :user, foreign_key: true
      t.references :customer, foreign_key: true
      t.string :direction

      t.timestamps
    end
  end
end
