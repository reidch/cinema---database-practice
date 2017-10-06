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

end
