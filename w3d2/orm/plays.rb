require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Playwright
  attr_accessor :name, :birth_year
  
  def self.all
    data = PlayDBConnection.instance.execute(<<-SQL)
      SELECT *
      FROM playwrights
    SQL
    
    data.map { |datapiece| Playwright.new(datapiece) }
    # datapiece comes in as hash because we selected 'results as hash' in
    # our database connection class
  end
  
  def self.find_by_name(name)
    playwright = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT *
      FROM playwrights
      WHERE name = ?
    SQL
    # the PlayDBConnection returns an array of results containing the data we need
    # [ {}, {}, {} ]
    return nil if playwright.empty?
    playwright.map { |data| Playwright.new(data) } 
    #turns the area of hashes into an array of instances
  end
  
  def initialize(options) #hash
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end
  
  def create
    raise "#{self} already in database" if @id
    # if this was a new instance that we made calling Playwright.new,
    # we wouldn't have given it an id yet (sql does that for us).
    # Therefore, if there is an id already stored in this instance,
    # then the instance is already in the database.
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      INSERT INTO 
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL
    # we can pass in our instance variables where we declare sql
    # the '?' signify these instance variables we passed in.
    # '?' will safeguard against sql injection attacks
    @id = PlayDBConnection.instance.last_insert_row_id
    # now the instance we are working with is in the database, but the
    # id that sql attached to it is not stored in our instance variable yet.
    # We use the 'last_insert_row_id' to grab that id, and set the variable
  end
  
  def update
    raise "#{self} can't be updated" unless @id
    # if the instance isn't in the database, then we can't update it.
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
    # we pass in our id instance variable so that we can identify the
    # correct row in the playwrights table.  once we call the update query,
    # we're done.  The data has been updated, and the id hasn't changed.
  end
  
  
end

class Play
  attr_accessor :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end
  
  def self.find_by_title(title)
    play = PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        plays
      WHERE
        title = ?
    SQL
    return nil if play.empty?
    play.map { |data| Play.new(data) }
  end
  
  def self.find_by_playwright(name)
    play = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        plays.*
      FROM
        plays JOIN playwrights
        ON plays.playwright_id = playwrights.id
      WHERE
        playwrights.name = ?
    SQL
    return nil if play.empty?
    play.map { |data| Play.new(data) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end
