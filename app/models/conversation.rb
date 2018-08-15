class Conversation < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :conversation_customers, dependent: :destroy
  has_many :customers, through: :conversation_customers
  belongs_to :conversation_phone_number

  def self.active_for_phone_number(customer_phone_number)
    includes(:conversation_phone_number)
      .find_by(active: true, conversation_phone_numbers: { digits: customer_phone_number })
  end

  def self.active_for_conversation_customers(customers)
    includes(:customers)
      .where(active: true, customers: { id: customers })
  end
end
