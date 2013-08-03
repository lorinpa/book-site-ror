class AddUniqueAuthorNameIndex < ActiveRecord::Migration
  def change

    execute <<-SQL
                DROP INDEX IF EXISTS unique_author_name
            SQL

    execute <<-SQL
                CREATE UNIQUE INDEX unique_author_name ON authors (first_name, last_name)
            SQL
  end
end
