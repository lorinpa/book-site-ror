class AddUniqueBookIndex < ActiveRecord::Migration
  def change

    execute <<-SQL
                DROP INDEX IF EXISTS unique_book
            SQL

    execute <<-SQL
                CREATE UNIQUE INDEX unique_book ON books (title, author_id)
            SQL
  end
end
