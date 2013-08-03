module AuthorsHelper

    def books_by_link(author_id, num_books)
        if (num_books > 0)
            link_to( "%d" % num_books, books_by_author_path(:author_id => author_id), :class => "wide_link" )
        else 
            "None"
        end
    end
    
    def display_is_admin
        if  session.id.nil?
            "<p>Admin</p>"
        else
            "<p>Anon</p>"
        end 
    end

end
