class Pokemon
    attr_accessor :name, :type, :db, :id

    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
            INSERT INTO pokemon (name, type) Values (?, ?)
        SQL

        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = <<-SQL
            SELECT * FROM pokemon WHERE id = ?
        SQL

        row = db.execute(sql, id)[0]

        new_pokemon = self.new(name: row[1], type: row[2], db: db)
        new_pokemon.id = row[0]
        new_pokemon
    end
end
