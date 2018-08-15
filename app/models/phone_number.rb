class PhoneNumber < ApplicationRecord
  belongs_to :user

  validates_presence_of :digits
  validates_uniqueness_of :digits
end
