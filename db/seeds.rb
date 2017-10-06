require_relative('../models/customer')
require_relative('../models/film')
require_relative('../models/ticket')

require('pry-byebug')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()

customer1 = Customer.new({'name' => 'Catriona Miller', 'funds' => 10})
customer2 = Customer.new({'name' => 'Caroline Reid', 'funds' => 12})
customer3 = Customer.new({'name' => 'Mari Yakova', 'funds' => 14})
customer4 = Customer.new({'name' => 'Elizabeth Watson', 'funds' => 16})
customer5 = Customer.new({'name' => 'Aileen Watson', 'funds' => 18})
customer1.save()
customer2.save()
customer3.save()
customer4.save()
customer5.save()

film1 = Film.new({'title' => 'Blade Runner', 'price' => 5})
film2 = Film.new({'title' => 'Blade Runner 2049', 'price' => 10})
film1.save()
film2.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket2 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket3 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket4 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket5 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()

binding.pry
nil
