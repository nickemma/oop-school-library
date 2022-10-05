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
    super()
    @books = []
    @people = []
    @rentals = []
    # Data.new
  end

  # app run method
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

    file = File.read('./books.json')
    data = JSON.parse(file)
    data.each do |book|
      @books << Book.new(book['title'], book['author'])
    end
  end

  # ========load people ========
  def load_people
    return unless File.exist?('./people.json')

    file = File.read('./people.json')
    data = JSON.parse(file)
    data.each do |person|
      @people <<
        if person['parent_permission']
          Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
        else
          Teacher.new(person['age'], person['specialization'], person['name'])
        end
    end
  end

  # =======Load retals =========
  def load_rentals
    return unless File.exist?('./rentals.json')

    file = File.read('./rentals.json')
    data = JSON.parse(file)
    data.each do |rental|
      @rentals << Rental.new(rental['date'], @people.select do |person|
                                               person.name == rental['person']
                                             end.first, @books.select do |book|
                                                          book.title == rental['book']
                                                        end.first)
    end
  end
end
