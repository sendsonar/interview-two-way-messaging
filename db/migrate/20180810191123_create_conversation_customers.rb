class CreateConversationCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :conversation_customers do |t|
      t.references :conversation, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
