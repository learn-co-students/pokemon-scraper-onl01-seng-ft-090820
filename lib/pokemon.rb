class Pokemon
attr_accessor :name, :type, :db
attr_reader :id

def initialize(id:, name:, type:, db:)
@id = id 
@name = name 
@type = type
@db = db
end

def save(name, type, db)
sql = <<-SQL
INSERT INTO pokemon(name, type, db) VALUES (?, ?, @db)
SQL
@db.execute(sql, self.name)
@id = @db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
end



end
