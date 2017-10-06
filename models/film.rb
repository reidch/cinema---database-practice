require_relative('../db/sql_runner')
require_relative('./customer')
require_relative('./ticket')
# don't think it needs to all from models

class Film

	attr_reader :id
	attr_accessor :title, :price

	def initialize(options)
		@id = options['id'].to_i
		@title = options['title']
		@price = options['price'].to_i
	end

	def save()
		sql = "INSERT INTO films
		(
			title,
			price
		)
		VALUES
		(
			$1, $2
		)
		returning id;"
		values = [@title, @price]
		film = SqlRunner.run(sql, values).first
		@id = film['id'].to_i
	end

	def self.delete_all()
		sql = "DELETE FROM films"
		values = []
		SqlRunner.run(sql, values)
	end

end
