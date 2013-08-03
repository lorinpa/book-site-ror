class CreateBooks < ActiveRecord::Migration
  def change
    execute <<-SQL
                DROP TABLE IF EXISTS books
            SQL

    execute <<-SQL
                CREATE TABLE books ( id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                title varchar(50) NOT NULL,
                created_at datetime, updated_at datetime, author_id integer NOT NULL,
                FOREIGN KEY (author_id) REFERENCES authors(id) ON DELETE CASCADE)
            SQL
  end
end
