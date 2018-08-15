require 'rails_helper'

RSpec.describe ConversationsController, type: :controller do

  describe "user matches two customers" do
    before(:each) do
      @user = User.create!(name: "user 1")
      @customer1 = Customer.create!(username: "customer 1", phone_number: "+12345678900")
      @customer2 = Customer.create!(username: "customer 2", phone_number: "+19876543211")
    end

    it "should create a new conversation" do
      expect {
        post :match, params: { customers: [@customer1, @customer2] }
      }.to change(Conversation,:count).by(1)
    end

    it "should generate and store a new phone number" do
      expect {
        post :match, params: { customers: [@customer1, @customer2] }
      }.to change(ConversationPhoneNumber,:count).by(1)
    end

    it "should add the customers to the conversation" do
      post :match, params: { customers: [@customer1, @customer2] }

      @conversation = Conversation.last
      expect(@conversation.customers.include?(@customer1)).to be_truthy
      expect(@conversation.customers.include?(@customer2)).to be_truthy
    end

    it "should add the conversation to the user's conversations" do
      post :match, params: { customers: [@customer1, @customer2] }

      expect(@user.conversations.include?(Conversation.last)).to be_truthy
    end
  end

  describe "user sends a message" do
    before(:each) do
      @user = User.create!(name: "user 1")
      @customer1 = Customer.create!(username: "customer 1", phone_number: "+12345678900")
      @customer2 = Customer.create!(username: "customer 2", phone_number: "+19876543211")
      @conv_phone_number = ConversationPhoneNumber.create!(digits: "+11112223333")
      @conversation = Conversation.create!(user: @user,
                                           customers: [@customer1, @customer2],
                                           conversation_phone_number: @conv_phone_number)
    end

    it "should store the message" do
      expect {
        post :send_user_message, params: { text: "Test message", id: @conversation }
      }.to change(Message,:count).by(1)
    end

    it "should add the message to the conversation" do
      post :send_user_message, params: { text: "Test message", id: @conversation }

      expect(@conversation.messages.include?(Message.last)).to be_truthy
    end
  end

  describe "process incoming message" do
    before(:each) do
      @user = User.create!(name: "user 1")
      @customer1 = Customer.create!(username: "customer 1", phone_number: "+12345678900")
      @customer2 = Customer.create!(username: "customer 2", phone_number: "+19876543211")
      @conv_phone_number = ConversationPhoneNumber.create!(digits: "+11112223333")
      @conversation = Conversation.create!(user: @user,
                                           customers: [@customer1, @customer2],
                                           conversation_phone_number: @conv_phone_number)
    end

    it "should store the message" do
      expect {
        post :process_message,
             params: { to_phone_number: @conv_phone_number.digits,
                       from_phone_number: @customer1.phone_number,
                       text: "Test message" }
      }.to change(Message,:count).by(1)
    end

    it "should add the message to the conversation" do
      post :process_message,
           params: { to_phone_number: @conv_phone_number.digits,
                     from_phone_number: @customer1.phone_number,
                     text: "Test message" }

      expect(@conversation.messages.include?(Message.last)).to be_truthy
    end
  end

end
