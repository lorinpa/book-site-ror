class AddUniqueCateogryIndex < ActiveRecord::Migration
  def change
    execute <<-SQL
                DROP INDEX IF EXISTS unique_category
            SQL

    execute <<-SQL
                CREATE UNIQUE INDEX unique_category ON categories (title)
            SQL
  end
end
