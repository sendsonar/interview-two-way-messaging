class MessagingService
  def self.send(text, to_phone_number, from_phone_number)
    puts "Message sent from #{from_phone_number} to #{to_phone_number} with text: #{text}"
  end

  def self.get_new_phone_number
    # returns newly created number
    "+#{rand(1000000000..9999999999)}"
  end
end
