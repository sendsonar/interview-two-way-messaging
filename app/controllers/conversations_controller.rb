class ConversationsController < ApplicationController
  include QueryPhoneNumbersConcern
  include StoreMessageConcern
  include StoreConversationConcern

  before_action :set_conversation, only: [:send_user_message]
  before_action :set_user, only: [:match, :send_user_message] #remove when authentication is implemented

  def match
    customers = Customer.with_ids(params[:customers])
    new_phone_number = phone_number_for_new_conversation(customers)
    conversation = store_conversation(@user, new_phone_number, customers)
    conversation
  end

  def send_user_message
    @conversation.customers.each do |customer|
      MessagingService.send(params[:text],
                            customer.phone_number,
                            @conversation.conversation_phone_number.digits)
    end
    store_message(params[:text], @user, @conversation, nil, 'sent')
  end

  def process_message
    conv = Conversation.active_for_phone_number(params[:to_phone_number])

    if conv.nil?
      puts "Customer is not part of an active conversation"
    else
      customer = conv.customers.find_by(phone_number: params[:from_phone_number])
      conv.customers.each do |other_customer|
        MessagingService.send(params[:text], other_customer.phone_number,
              conv.conversation_phone_number.digits) unless other_customer == customer
      end
      store_message(params[:text], nil, conv, customer, 'received')
    end
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end

  def set_user
    @user = User.last
  end
end
