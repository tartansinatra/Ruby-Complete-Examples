class Person
  attr_reader :name, :books

  def initialize(name)
    @name = name
    @books = {}
  end

  def borrow(book)
    books[book.title] = book
  end

  def return(book_key)
    @books.delete(book_key)
  end

  def list_books
    return "'#{name}'' has no books at the moment" if @books.empty?
    book_strings_array = books.map do |key, book|
      book.pretty_string
    end
    books_string = book_strings_array.join("\n")
    "'#{name}' has the following books: #{books_string}"
  end

  def pretty_string
    "'#{name}' has #{books.size} book#{'s' unless books.size == 1} borrowed at the moment."
  end
end