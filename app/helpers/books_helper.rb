module BooksHelper

    def reviews_link(book_id, num_reviews)
        if (num_reviews > 0)
            link_to( "%d" % num_reviews, reviews_of_book_path(:book_id => book_id), :class => "wide_link" )
        else 
            "None"
        end

    end

    def categories_link(book_id, num_categories)
        if (num_categories > 0)
            link_to( "%d" % num_categories, categories_of_book_path(:book_id => book_id), :class => "wide_link" )
        else 
            "None"
        end

    end
end
