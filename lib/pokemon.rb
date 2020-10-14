class Pokemon

    attr_accessor :name, :type, :id, :db

    def initialize(id:, name:, type:, db:)
        @name = name
        @type = type
        @db = db
        @id = id
    end

    def update
        sql = "UPDATE pokemon SET name = ?, type = ?, WHERE id = ?"
        @db.execute(sql, self.name, self.type, self.id)
    end

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
        db.execute(sql, name, type)
        # @id = @db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = #{id}"
        array = db.execute(sql)
        new_pokemon = self.new(id: array[0][0], name: array[0][1], type: array[0][2], db: db)
    end

end
