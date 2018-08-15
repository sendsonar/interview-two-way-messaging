class User < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :conversations, dependent: :destroy
  has_one :phone_number, dependent: :destroy
end
