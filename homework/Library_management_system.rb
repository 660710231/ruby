class Book
  attr_reader :title, :author

  def initialize(title, author)
    @title  = title
    @author = author
    @borrowed = false
  end

  def available?
    !@borrowed
  end

  def borrow!
    if available?
      @borrowed = true
    end
  end

  def return!
    @borrowed = false
  end
end

class Member
  attr_reader :name, :books

  def initialize(name)
    @name = name
    @books = []
  end

  def borrow(book)
      if book.available?
        book.borrow!
        @books << book
        puts "Success, #{book.title} has been borrowed"
      else
        puts "Fail, #{book.title} is unavailable."
      end
  end

  def return(book)
    if @books.include?(book)
      book.return!
      @books.delete(book)
      puts "Success, #{book.title} has been returned"
    else
      puts "Fail, #{book.title} is not borrowed"
    end
  end
end

ruby_book = Book.new("Ruby", "Bob")
oop_book  = Book.new("OOP", "Cat")
somchai = Member.new("Somchai")
somsri  = Member.new("Somsri")

somchai.borrow(ruby_book)
somsri.borrow(ruby_book)
somsri.return(ruby_book)
somchai.return(ruby_book)
somsri.borrow(ruby_book)