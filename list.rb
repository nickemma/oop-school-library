class List
  # ======= show list all the books =======
  def list_all_books
    if @books.empty?
      puts 'There are no books in the library'
    else
      @books.each_with_index { |book, i| puts "#{i}) Title: '#{book.title}', Author: #{book.author}" }
    end
  end

  # ======= show list all the peoples =======
  def list_all_people
    if @people.empty?
      puts 'There are no people in the library'
    else
      @people.each_with_index do |person, i|
        puts "#{i}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  # ======== create student =======
  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N] '
    parent_permission = gets.chomp
    parent_permission = true if parent_permission == 'y'
    parent_permission = false if parent_permission == 'n'
    student = Student.new(age, name, parent_permission)
    if File.exist?('./people.json')
      File.open('./people.json', 'r') do |file|
        @people = JSON.parse(file.read)
      end
    end
    @people << student
    save = []
    @people.each do |person|
      save << { name: person.name, id: person.id, age: person.age,}
    end
    save_teacher = JSON.pretty_generate(save)
    File.write('./people.json', save_teacher.to_s)
    puts "Student created successfully!😊\n"
  end

  # ========= create teacher ==========
  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    if File.exist?('./people.json')
      file = File.read('./people.json')
      @people = JSON.parse(file)
      @people.each do |person|
        @people << { name: person.name, id: person.id, age: person.age }
      end
    end
    @people << teacher
    save = []
    @people.each do |person|
      save << { name: person.name, id: person.id, age: person.age }
    end
    save_teacher = JSON.pretty_generate(save)
    File.write('./people.json', save_teacher.to_s)
    puts "Teacher created successfully!😊\n"
  end

  # ========= create books ========
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    if File.exist?('./books.json')
      file = File.read('./books.json')
      @books = JSON.parse(file)
      @books.each do |book|
        @books << { title: book.title, author: book.author }
      end
    end
    @books << book
    save = []
    @books.each do |bookk|
      save << { title: bookk.title, author: bookk.author }
      save_book = JSON.pretty_generate(save)
      File.write('./books.json', save_book.to_s)
      puts "The book \'#{title}\' by #{author} was created successfully!📖\n"
    end
  end

  # ======== create rentals ========
  def create_rental
    puts 'Your Library is empty' if @people.empty? && @books.empty?
    puts "Select a book from the following list by number:\n"
    list_all_books
    book_index = gets.chomp.to_i
    puts "Select a person from the following list by number:\n"
    list_all_people
    person_index = gets.chomp.to_i
    puts 'Enter a date: [yyyy-mm-dd]'
    date = gets.chomp
    rental = Rental.new(date, books[book_index], people[person_index])
    @rentals << rental
    save = []
    @rentals.each do |rent|
      save << { date: rent.date, book: rent.book.title, person: rent.person.name }
    end
    save_rental = JSON.pretty_generate(save)
    File.write('./rentals.json', save_rental)
    puts "Rental created successfully!📚\n"
  end

  # ========= check the name and date of rentals ========
  def list_all_rentals
    puts 'Enter ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
  end
end
