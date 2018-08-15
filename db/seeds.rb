c1 = Customer.create(username: 'eddie-rider', phone_number: '+15551234567')
c2 = Customer.create(username: 'rachel-driver', phone_number: '+15552345678')
c3 = Customer.create(username: 'martin-driver', phone_number: '+15559876543')
c4 = Customer.create(username: 'sarah-driver', phone_number: '+15558765432')
c5 = Customer.create(username: 'lisa-driver', phone_number: '+15557654321')

u = User.create(name: 'Sonar Support User')

PhoneNumber.create(digits: '+14449876543', user: u)

Message.create(user: u, customer: c1, text: 'Hey Eddie, your ride is here', direction: 'sent')
Message.create(user: u, customer: c2, text: 'Hey Rachel, your passenger is here', direction: 'sent')

cpn1 = ConversationPhoneNumber.create(digits: '+11112223333')
cpn2 = ConversationPhoneNumber.create(digits: '+12223334444')
cpn3 = ConversationPhoneNumber.create(digits: '+13334445555')

conv1 = Conversation.create(user: u, conversation_phone_number: cpn1)
conv1.customers << c1
conv1.customers << c2

conv2 = Conversation.create(user: u, conversation_phone_number: cpn2)
conv2.customers << c2
conv2.customers << c3

conv3 = Conversation.create(user: u, conversation_phone_number: cpn3)
conv3.customers << c3
conv3.customers << c4


