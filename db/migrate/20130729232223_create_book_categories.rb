class CreateBookCategories < ActiveRecord::Migration

  def change
    execute <<-SQL
                DROP TABLE IF EXISTS book_categories
            SQL

    execute <<-SQL
                CREATE TABLE book_categories ( id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                book_id INTEGER NOT NULL,
                category_id INTEGER NOT NULL,
                created_at datetime, updated_at datetime,
                FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE,
                FOREIGN KEY (category_id) REFERENCES catogries(id) ON DELETE CASCADE
                )
            SQL
  end

end
