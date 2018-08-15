class RemovePhoneNumberFromConversations < ActiveRecord::Migration[5.1]
  def change
    remove_column :conversations, :phone_number, :string
  end
end
