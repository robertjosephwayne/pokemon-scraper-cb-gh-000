class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(name="NULL", type="NULL", db=nil)
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)', name, type)
  end

  def self.find(id, db)
    row = db.execute('SELECT id, name, type FROM pokemon WHERE id = (?)', id).first

    pokemon = self.new(row[1], row[2], db)
    pokemon.id = row[0]
    pokemon
  end
end
