require 'pry-debugger'

class Book
  attr_reader :author, :title
  attr_accessor :id

  def initialize(title, author)
    @author = author
    @title = title
    @checked_out = false
  end

  def status
      return @checked_out ? "checked_out" : "available"
  end

  def check_out
      puts "can't be checked out twice in a row" if @checked_out
      return false if @checked_out
      @checked_out = true
      true
  end

  def check_in
      puts "#{@title} is not checked out" if !@checked_out
      return false if !@checked_out
      @checked_out = false
      true
  end


end

class Borrower
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

class Library

  attr_accessor :books

  def initialize(name)
    @books = []
    @id = 10000
    @books_checked_out = {}
  end

  def register_new_book(title, name)
    book = Book.new(title,name)
    book.id = @id += 1
    @books << book
  end

  def check_out_book(book_id, borrower)
    #find book
    book = @books.find { | bk | bk.id == book_id }
    return nil if book == nil || book.check_out == false
    customer = Borrower.new(borrower)
    @books_checked_out[book] = customer
    return book
  end

  def check_in_book(book)
    @books_checked.has_key?(book) ? false : true
  end

  def available_books
  end

  def borrowed_books
  end

  def get_borrower(book_id)
      book_list = @books_checked_out.keys.select { |bk| bk.id == book_id }
      book = book_list.first
      borrower = @books_checked_out[book]
      borrower.name
      binding.pry
  end
end
