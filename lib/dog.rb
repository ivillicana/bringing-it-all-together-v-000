class Dog
  attr_accessor :name, :breed, :id


  def initialize (attributes, id=nil)
    attributes.each {|key, value| self.send("#{key}=", value)}
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS dogs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        breed TEXT
      )
      SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    DB[:conn].execute("DROP TABLE IF EXISTS dogs")
  end

  def save (name:, breed:)
    if self.id
      self.update
    else
      sql = <<-SQL
        INSERT INTO dogs (name, breed)
          VALUES (?, ?)
          SQL
      DB[:conn].execute(sql, name, breed)
    end
  end
end
