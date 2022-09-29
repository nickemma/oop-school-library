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

 def create_student(age, name, classroom, parent_permission)
  student = Student.new(age, name, classroom, parent_permission: parent_permission)
  @people << student unless @people.include?(student)
  @students << student unless @students.include?(student)
 end

 def create_teacher
  puts 'Age:'
  age = gets.chomp
  puts 'Name:'
  name = gets.chomp
  puts 'Specialization:'
  specialization = gets.chomp
  teacher = Teacher.new(age, specialization, name)
  @people << teacher unless @people.include?(teacher)
  puts 'Person created successfully'
 end

 def create_book
  puts 'Enter the title of the book:'
  title = gets.chomp
  puts 'Enter the author of the book:'
  author = gets.chomp
  book = Book.new(title, author)
  puts "The book \'#{title}\' by #{author} is created successfully!"
  @book_list << book unless @book_list.include?(book)
 end

end