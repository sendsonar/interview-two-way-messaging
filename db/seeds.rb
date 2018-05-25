c1 = Customer.create(username: 'eddie-rider', phone_number: '+15551234567')
c2 = Customer.create(username: 'rachel-driver', phone_number: '+15551234567')

u = User.create(name: 'Sonar Support User')

Message.create(user: u, customer: c1, text: 'Hey Eddie, your ride is here')
Message.create(user: u, customer: c2, text: 'Hey Rachel, your passenger is here')
