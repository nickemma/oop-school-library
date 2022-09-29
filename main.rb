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
    list_rentals_by_id
  end
end

main