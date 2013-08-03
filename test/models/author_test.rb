require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
    fixtures :authors

    test "is Mark Twain" do
        @author = authors(:one)

        assert_equal("Mark", @author.first_name)
        assert_equal("Twain", @author.last_name)
    end

    test "is Brad Meltzer" do
        @author = authors(:two)
        assert_equal("Brad", @author.first_name)
        assert_equal("Meltzer", @author.last_name)
    end

    test "rejects no name" do
        author = Author.new
        assert !author.save
    end

    test "accepts  name" do
        author = Author.new
        author.first_name = "Joe"
        author.last_name = "Smoe"
        assert author.save
    end


    test "rejects rejects duplicate name" do
        author = Author.new
        author.first_name = "Mark"
        author.last_name = "Twain"
        assert_raise ActiveRecord::RecordNotUnique do
            assert author.save
        end
    end

end
