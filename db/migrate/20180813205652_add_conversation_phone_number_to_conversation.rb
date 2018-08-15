class AddConversationPhoneNumberToConversation < ActiveRecord::Migration[5.1]
  def change
    add_reference :conversations, :conversation_phone_number, foreign_key: true
  end
end
