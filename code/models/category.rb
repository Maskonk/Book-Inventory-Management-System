require_relative '../db/sql_runner'
require_relative 'book'

class Category
  attr_reader :id, :name
  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save
    sql = "INSERT INTO categories
          (name)
          VALUES
          ($1) RETURNING *"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
  end

  def update
    sql = "UPDATE categories SET
          (name)
          = ($1) WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM categories WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def books
    sql = "SELECT books.* from books JOIN categories ON categories.id = books.category_id WHERE categories.id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    result.map {|item| Book.new(item)}
  end

  def self.all
    sql = "SELECT * FROM categories"
    result = SqlRunner.run(sql)
    result.map {|author| Category.new(author)}
  end

  def self.find(id)
    sql = "SELECT * FROM categories WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    Category.new(result.first)
  end

  def self.delete_all
    sql = "DELETE FROM categories"
    SqlRunner.run(sql)
  end


end
