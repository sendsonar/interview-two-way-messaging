module StoreMessageConcern
  extend ActiveSupport::Concern

  def store_message(text, user, conversation, customer, direction)
    message = Message.new(
      text: text,
      conversation: conversation,
      user: user,
      customer: customer,
      direction: direction
    )
    if message.save
      puts 'Message saved!'
    else
      puts "Error in saving message for conversation with id #{conv.id}"
    end
  end
end
