require_relative 'app'

def main
 puts 'Welcome to School library App!'
 app = App.new
 app.run
end

def list_holder
 case option
   when 1
    list_all_books
  when 2
    list_all_people
  when 3
    create_person
  when 4
    create_book
  when 5
    create_rental
  when 6
    List all rentals for a given person id
  end
end

def display_list
    puts 'Once again you are Welcome!'
    puts "
      Choose an option by entering a number:
      1 - List all books
      2 - List all people
      3 - Create a person
      4 - Create a book
      5 - Create a rental
      6 - List all rentals for a given person id
      7 - Exit"

    option = gets.chomp.to_i
    list_holder
end



main
