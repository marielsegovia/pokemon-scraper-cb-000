class Pokemon

  attr_accessor :name, :type, :db, :id, :hp

  def initialize( name:, type:, db:, id:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    poke_info = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id:poke_info[0], name: poke_info[1], type: poke_info[2], hp: poke_info[3], db: db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

end
