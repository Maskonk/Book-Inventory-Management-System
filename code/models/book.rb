require_relative '../db/sql_runner'
require_relative 'author'

class Book
  attr_accessor :id, :name, :description, :quantity, :buying_cost, :selling_cost, :author_id, :markup
  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @description = options['description']
    @quantity = options['quantity']
    @buying_cost = options['buying_cost'].to_f
    @selling_cost = options['selling_cost'].to_f
    @author_id = options['author_id'].to_i
    @markup = (((@selling_cost / @buying_cost) - 1)*100).round(2)
  end

  def save
    sql = "INSERT INTO books
          (name, description, quantity, buying_cost, selling_cost, author_id)
          VALUES
          ($1, $2, $3, $4, $5, $6) RETURNING *"
    values = [@name, @description, @quantity, @buying_cost, @selling_cost, @author_id]
    result = SqlRunner.run(sql, values)
    @id =  result.first['id'].to_i
  end

  def update
    sql = "UPDATE books SET
          (name, description, quantity, buying_cost, selling_cost, author_id)
          = ($1, $2, $3, $4, $5, $6) WHERE id = $7"
    values = [@name, @description, @quantity, @buying_cost, @selling_cost, @author_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM books WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def author
    sql = "SELECT authors.* from authors JOIN books ON authors.id = books.author_id WHERE authors.id = $1"
    values = [@author_id]
    result = SqlRunner.run(sql, values).first
    Author.new(result)
  end

  def author_name
    a = author
    a.pretty_name
  end

  def self.all
    sql = "SELECT * FROM books"
    result = SqlRunner.run(sql)
    result.map {|item| Book.new(item)}
  end

  def self.find(id)
    sql = "SELECT * FROM books WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    Book.new(result.first)
  end

  def self.delete_all
    sql = "DELETE FROM books"
    SqlRunner.run(sql)
  end

end
