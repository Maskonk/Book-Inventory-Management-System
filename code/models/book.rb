require_relative '../db/sql_runner'

class Book
  attr_reader :id, :name, :description, :quantity, :buying_cost, :selling_cost, :author_id
  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @description = options['description']
    @quantity = options['quantity']
    @buying_cost = options['buying_cost'].to_f
    @selling_cost = options['selling_cost'].to_f
    @author_id = options['author_id'].to_i
  end

  def save
    sql = "INSERT INTO items
          (name, description, quantity, buying_cost, selling_cost, author_id)
          VALUES
          ($1, $2, $3, $4, $5, $6) RETURNING *"
    values = [@name, @description, @quantity, @buying_cost, @selling_cost, @author_id]
    result = SqlRunner.run(sql, values)
    @id =  result.first['id'].to_i
  end

  def update
    sql = "UPDATE items SET
          (name, description, quantity, buying_cost, selling_cost, author_id)
          = ($1, $2, $3, $4, $5, $6) WHERE id = $7"
    values = [@name, @description, @quantity, @buying_cost, @selling_cost, @author_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM items WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM items"
    result = SqlRunner.run(sql)
    result.map {|item| Book.new(item)}
  end

  def self.find(id)
    sql = "SELECT * FROM items WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    Book.new(result.first)
  end

  def self.delete_all
    sql = "DELETE FROM items"
    SqlRunner.run(sql)
  end

end
