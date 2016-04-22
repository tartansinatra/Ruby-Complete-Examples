class Library
  attr_reader :name, :books, :people

  def initialize(name)
    @name = name
    @books = {}
    @people = {}
  end

  def list_books
    if books.empty?
      "There are no books in the library at the moment"
    else
      books.map do |key, book|
        book.pretty_string
      end.join("\n")
    end
  end

  def list_people
    if people.empty?
      "There are no people in the library at the moment"
    else
      people.map do |key, person|
        person.pretty_string
      end.join("\n")
    end
  end

  def add_book(book)
    books[book.title] = book
  end

  def add_person(person)
    people[person.name] = person
  end

  def lend(person_name, book_name)
    person = people[person_name]
    book = books.delete(book_name)
    person.borrow(book)
  end

  def return(person_key, book_key)
    person = @people[person_key]
    return "Invalid person name" if !person
    book = person.return(book_key)
    return "Invalid book name" if !book
    add_book(book)
  end

  def list_borrowed_books
    people_books_array = @people.map do |key, person|
      person.list_books
    end
    people_books_array.join("\n")
  end

end