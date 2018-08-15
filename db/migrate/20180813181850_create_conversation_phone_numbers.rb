class CreateConversationPhoneNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :conversation_phone_numbers do |t|
      t.string :digits

      t.timestamps
    end
  end
end
