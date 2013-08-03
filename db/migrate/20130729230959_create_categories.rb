class CreateCategories < ActiveRecord::Migration
  def change
    execute <<-SQL
                DROP TABLE IF EXISTS categories
            SQL

    execute <<-SQL
                CREATE TABLE categories ( id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                title varchar(50) NOT NULL,
                created_at datetime, updated_at datetime)
            SQL
  end
end
