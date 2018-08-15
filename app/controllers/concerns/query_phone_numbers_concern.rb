module QueryPhoneNumbersConcern
  extend ActiveSupport::Concern

  def phone_number_for_new_conversation(customers)
    valid_phone_number = get_non_active_phone_number_for_customers(customers)

    if valid_phone_number.nil?
      new_number = MessagingService.get_new_phone_number
      valid_phone_number = ConversationPhoneNumber.create!(digits: new_number)
    end
    valid_phone_number
  end

  def get_non_active_phone_number_for_customers(customers)
    customer_conversation_numbers =
      Conversation.active_for_conversation_customers(customers)
                  .pluck(:conversation_phone_number_id)
                  .uniq

    valid_phone_number =
      ConversationPhoneNumber.find{ |number| !customer_conversation_numbers.include?(number.id) }

    valid_phone_number
  end
end