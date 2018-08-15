class Customer < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :conversation_customers, dependent: :destroy
  has_many :conversations, through: :conversation_customers

  validates_presence_of :username, :phone_number
  validates_uniqueness_of :username, :phone_number

  def self.with_ids(customer_ids)
    where(id: customer_ids)
  end
end
