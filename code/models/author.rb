require_relative '../db/sql_runner'

class Author

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save
    sql = "INSERT INTO manufacturers
          (name)
          VALUES
          ($1) RETURNING *"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result['id'].to_i
  end

  def update
    sql = "UPDATE manufacturers SET
          (name)
          = ($1) WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM manufacturers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM manufacturers"
    result = SqlRunner.run(sql)
    result.map {|manufacturer| Author.new(manufacturer)}
  end

  def self.find(id)
    sql = "SELECT * FROM manufacturers WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    Author.new(result)
  end

end