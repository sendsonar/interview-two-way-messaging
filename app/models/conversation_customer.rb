class ConversationCustomer < ApplicationRecord
  belongs_to :conversation
  belongs_to :customer
end
