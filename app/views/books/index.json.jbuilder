json.set! :books do
    json.array!(@books) do |book|
        json.extract! book,  :id, :title
        json.review_count book.reviews.count
        json.categories_count book.book_categories.count
        json.author_last_name book.author.last_name
        json.author_first_name book.author.first_name
        json.author_id book.author.id
    end
end

