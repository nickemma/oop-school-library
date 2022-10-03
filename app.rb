require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'list'
require 'json'
require './data'
class App < List
  attr_accessor :books, :people
  def initialize
    # super()
    @books = []
    @people = []
    @rentals = []
    # @students = []
    # @teachers = []
    # Data.new
  end

  def run
    display_list
  end

   # ======== Create person =======
  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person_type = gets.chomp
    case person_type
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid option'
      create_person
    end
  end

  # ======== Load books=======
  
  def load_books
    return unless File.exist?('./books.json')

    books = JSON.parse(File.read('./books.json'))
    print books.class
    books.each do |book|
      @books << Book.new(title: book['title'], author: book['author'])
    end
  end

  # ========load people ========
  def load_people
    return unless File.exist?('./people.json')

    people = JSON.parse(File.read('./people.json'))
    people.each do |person|
      @people <<
        if person['parent_permission']
          Student.new(age: person['age'], name: person['name'],
          parent_permission: person['parent_permission'])
        else
          Teacher.new(age: person['age'], specialization: person['specialization'], name: person['name'])
        end
    end
  end
# =======Load retals =========
  def load_rentals
    return unless File.exist?('./rentals.json')

    rentals = JSON.parse(File.read('./rentals.json'))
    rentals.each do |rental|
      @rentals << Rental.new(date: rental['date'],
      person: @people.select { |person| person.name == rental['person'] }.first,
      book: @books.select { |book| book.title == rental['book'] }.first)
    end
  end
end
