json.set! :authors do

    json.array!(@authors) do |author|
        json.extract! author, :id, :first_name, :last_name
        json.book_count author.books.count
    end
end
