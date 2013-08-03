json.set! :book_categories do
    json.array!(@book_categories) do |book_category|
      json.extract! book_category, :id, :book_id, :category_id
    end
end
