require_relative 'person'
require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'classroom'

class App
 attr_accessor :books_list, :people

 def initialize
   @books_list = []
   @people = []
   @rentals = []
   @students = []
   @teachers = []
 end

 def run
   display_list
 end

 def list_all_books
  if @books.empty?
    puts 'There are no books in the library'
  else
    @books.each { |book| puts "Title: '#{book.title}', Author: #{book.author}" }
  end
 end

end