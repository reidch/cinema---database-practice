require_relative('../models/customer')
require_relative('../models/film')
require_relative('../models/ticket')

require( 'pry-byebug' )

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()


binding.pry
nil
