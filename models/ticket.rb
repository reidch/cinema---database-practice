require_relative('../db/sql_runner')
require_relative('./film')
require_relative('./customer')
# don't think it needs to all from models

class Ticket

	attr_reader :id
	attr_accessor :customer_id, :film_id

	def initialize(options)
		@id = options['id'].to_i
		@customer_id = options['customer_id'].to_i
		@film_id = options['film_id'].to_i
	end

	def save()
		sql = "INSERT INTO tickets
		(
			customer_id,
			film_id
		)
		VALUES
		(
			$1, $2
		)
		returning id;"
		values = [@customer_id, @film_id]
		ticket = SqlRunner.run(sql, values)
		@id = ticket['id'].to_i
	end

	def self.delete_all()
		sql = "DELETE FROM tickets"
		values = []
		SqlRunner.run(sql, values)
	end

end
