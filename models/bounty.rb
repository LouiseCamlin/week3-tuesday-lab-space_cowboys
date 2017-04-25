require "pg"

class Bounty

  attr_accessor :name, :bounty_value, :favourite_weapon, :collected_by
  attr_reader :id

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
    @bounty_value = params['bounty_value'].to_i
    @favourite_weapon = params['favourite_weapon']
    @collected_by = params['collected_by']
  end

  def save()
    db = PG.connect({ dbname: 'space_cowboys', host: 'localhost' })

    sql =
      "INSERT INTO bounties
      (name, bounty_value, favourite_weapon, collected_by)
      VALUES
      ('#{@name}', #{@bounty_value}, '#{@favourite_weapon}', '#{@collected_by}')
      RETURNING *;"

    @id = db.exec(sql).first()['id'].to_i

    db.close()
  end

  def update()
    db = PG.connect({ dbname: 'space_cowboys', host: 'localhost' })

    sql =
      "UPDATE bounties
      SET (name, bounty_value, favourite_weapon, collected_by) =
      ('#{@name}', #{@bounty_value}, '#{@favourite_weapon}', '#{@collected_by}')
      WHERE id = #{@id};"

    db.exec(sql)

    db.close()
  end

  def Bounty.all()
    db = PG.connect({ dbname: 'space_cowboys', host: 'localhost' })
    sql = "SELECT * FROM bounties;"
    result = db.exec(sql)
    db.close()

    return result.map { |bounty_hash| Bounty.new(bounty_hash) }
  end

  def delete
      db = PG.connect({ dbname: 'space_cowboys', host: 'localhost' })
      sql = "DELETE FROM bounties WHERE id = #{@id};"
      db.exec(sql)
      db.close()
  end

  def Bounty.delete_all
      db = PG.connect({ dbname: 'space_cowboys', host: 'localhost' })
      sql = "DELETE FROM bounties;"
      db.exec(sql)
      db.close()
  end


end