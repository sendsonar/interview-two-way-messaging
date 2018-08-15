class ConversationPhoneNumber < ApplicationRecord
  has_many :conversations, dependent: :destroy

  validates_uniqueness_of :digits

end
