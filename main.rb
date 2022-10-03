require_relative 'refactor'

def main
  puts 'Welcome to School Library App!'
  refactor = Refactor.new
  loop do
    refactor.display_list
    option = gets.chomp.to_i
    case option
    when 1..6
      refactor.list_holder(option)
    else
      puts 'Thank you for using our app'
      break
    end
  end
end
main
