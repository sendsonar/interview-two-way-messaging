class AddConversationPhoneNumberToConversationCustomer < ActiveRecord::Migration[5.1]
  def change
    add_reference :conversation_customers, :conversation_phone_number, foreign_key: true
  end
end
