class RemoveConversationPhoneNumberFromConversationCustomer < ActiveRecord::Migration[5.1]
  def change
    remove_reference :conversation_customers, :conversation_phone_number, foreign_key: true
  end
end
