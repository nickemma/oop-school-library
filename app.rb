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
  if @books_list.empty?
    puts 'There are no books in the library'
  else
    @books_list.each { |book| puts "Title: '#{book.title}', Author: #{book.author}" }
  end
 end

 def list_all_people
  if @people.empty?
    puts 'There are no people in the library'
  else
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end
 end

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

 def create_student
  print 'Age: '
  age = gets.chomp.to_i
  print 'Name: '
  name = gets.chomp
  print 'Classroom '
  classroom = gets.chomp.to_i
  print 'Has parent permission? [Y/N] '
  parent_permission = gets.chomp
  parent_permission = parent_permission == 'y'
  parent_permission = parent_permission == 'n'
  student = Student.new(age, name, parent_permission)
  @people << student unless @people.include?(student)
  puts "Student created successfully!"
 end

 def create_teacher
  print 'Age: '
  age = gets.chomp.to_i
  print 'Name: '
  name = gets.chomp
  print 'Specialization: '
  specialization = gets.chomp
  teacher = Teacher.new(age, specialization, name)
  @people << teacher unless @people.include?(teacher)
  puts "Teacher created successfully!"
 end

 def create_book
  puts 'Enter the title of the book: '
  title = gets.chomp
  puts 'Enter the author of the book: '
  author = gets.chomp
  book = Book.new(title, author)
  puts "The book \'#{title}\' by #{author} is created successfully!"
  @books_list << book unless @books_list.include?(book)
 end

 def create_rental
  puts 'select a book from the following list by number '
  @books_list
  book_index = gets.chomp.to_i
  puts 'select a person from the following list by number (not id) '
  @people
  person_index = gets.chomp.to_i
  puts 'Enter the date of the rental: e.g 2022/09/28: '
  date = gets.chomp
  rental << Rental.new(date, @people[person_index], @books_list[book_index])
  puts 'Rental created successfully'
  @rentals << rental unless @rentals.include?(rental)
 end

 def list_rentals_for_person_id
  puts 'Enter the ID of the person: '
  id = gets.chomp.to_i
  puts 'Rentals: '
  if @rentals.empty?
    puts 'There are no rentals for this person '
  else
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
  end
 end

end