class AddUniqueBookCategoryIndex < ActiveRecord::Migration
  def change

    execute <<-SQL
                DROP INDEX IF EXISTS unique_book_category
            SQL

    execute <<-SQL
                CREATE UNIQUE INDEX unique_book_category ON book_categories (book_id, category_id)
            SQL
  end
end
