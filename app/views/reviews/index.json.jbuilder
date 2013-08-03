json.set! :reviews do
    json.array!(@reviews) do |review|
      json.extract! review, :id, :body, :stars, :book_id
      json.extract! review.book, :author_id
    end
end
