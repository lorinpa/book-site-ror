class CreateReviews < ActiveRecord::Migration
  def change
      
    execute <<-SQL
                DROP TABLE IF EXISTS reviews
            SQL

    execute <<-SQL
                CREATE TABLE reviews ( id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                stars INTEGER NOT NULL DEFAULT 0,
                body text NOT NULL, 
                book_id INTEGER NOT NULL,
                created_at datetime, updated_at datetime,
                FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE
                )
            SQL
  end
end
