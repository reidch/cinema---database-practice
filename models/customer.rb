require_relative('../db/sql_runner')
require_relative('./film')
require_relative('./ticket')
# don't think it needs to all from models

class Customer

	attr_reader :id
	attr_accessor :name, :funds

	def initialize(options)
		@id = options['id'].to_i
		@name = options['name']
		@funds = options['funds'].to_i
	end

	def save()
		sql = "INSERT INTO customers
		(
			name,
			funds
		)
		VALUES
		(
			$1, $2
		)
		returning id;"
		values = [@name, @funds]
		customer = SqlRunner.run(sql, values).first
		@id = customer['id'].to_i
	end

	def self.delete_all()
		sql = "DELETE FROM customers"
		values = []
		SqlRunner.run(sql, values)
	end

	def self.all()
		sql = "SELECT * FROM customers"
		values = []
		customers = SqlRunner.run(sql, values)
		result = customers.map {|customer| Customer.new(customer)}
		return result
	end

	def update()
		sql = "UPDATE customers SET
		(
			name,
			funds
		)
		=
		(
			$1, $2
		)
		WHERE id = $3"
		values = [@name, @funds, @id]
		SqlRunner.run(sql, values)
	end

	# def delete()
	# 	sql = "DELETE FROM customers WHERE id=$1;"
	# 	values = [@id]
	# 	SqlRunner.run(sql, values)
	# end

	def films()
		sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE customer_id = $1;"
		values = [@id]
		films = SqlRunner.run(sql, values)
		return films.map {|film| Film.new(film)}
	end

# not working yet
	# def tickets()
	# 	sql = "SELECT customers.* FROM customers INNER JOIN tickets ON tickets.customer_id = customers.id WHERE film_id = $1;"
	# 	values = [@id]
	# 	tickets = SqlRunner.run(sql, values)
	# 	return tickets
	# end

end
