class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id=nil, name=nil, type=nil, db=nil)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    ins = db.prepare('INSERT INTO pokemon (name, type) VALUES (?, ?)')
    ins.execute([name, type])
  end
end
