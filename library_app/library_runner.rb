require 'pry-byebug'

require_relative 'library'
require_relative 'book'
require_relative 'person'

library = Library.new 'Code Clan Library'

#create book
book_1 = Book.new(title: 'Fools Errand', genre: 'Fantasy')
library.add_book(book_1)
library.add_book(Book.new(title: "The Hobbit", genre: "Fantasy"))
library.add_book(Book.new(title: "Feersum Endjinn", genre: "Science Fiction"))
library.add_book(Book.new(title: "Histories", genre: "History"))
library.add_book(Book.new(title: "To Kill a Mockingbird", genre: "Fiction"))
library.add_book(Book.new(title: "A Brief History of Time", genre: "Non-Fiction"))
#list books
puts "All books #{library.list_books}\n"
#create person
person_1 = Person.new("Valerie")
library.add_person(person_1)
library.add_person(Person.new('Fred'))
library.add_person(Person.new('Wilma'))
library.add_person(Person.new('Barney'))
library.add_person(Person.new('Betty'))

#list people
puts "All people #{library.list_people}\n"

#lend book
person_name = "Wilma"
book_title = "The Hobbit"
library.lend(person_name, book_title)

puts "\nAll people after lending #{library.list_people}\n"
puts "\nAll books #{library.list_books}\n"

#return book
library.return(person_name, book_title)
#list borrowed book
puts library.list_borrowed_books

