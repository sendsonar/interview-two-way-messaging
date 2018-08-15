class Message < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :customer, optional: true
  belongs_to :conversation, optional: true

  validates_presence_of :text
end
