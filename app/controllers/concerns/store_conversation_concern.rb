module StoreConversationConcern
  extend ActiveSupport::Concern

  def store_conversation(user, phone_number, customers)
    conv = Conversation.new(user: user, conversation_phone_number: phone_number)
    if conv.save
      customers.each do |customer|
        conv.customers << customer
      end
      puts 'Conversation succesfully created!'
    else
      puts 'There was an error in saving the conversation'
    end
    conv
  end
end