require_relative 'refactor'

def main
  refactor = Refactor.new
  puts 'Welcome to School Library App!'
  refactor.display_list
  option = gets.chomp.to_i
  case option
  when 1..6 
    refactor.list_holder(option)
  when 7
    puts 'Thank you for using this app!'
  else
    puts 'Please enter a valid option'
  end
 end

main
