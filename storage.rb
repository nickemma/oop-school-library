require 'json'

module Storage
  def dump_all
    dump_books_list
    dump_people
    dump_rentals
  end

  def load_all
    load_books_list
    load_people
    load_rentals
  end

  def dump_books_list
    books = @books_list.map { |book| [book.id, book.title, book.author] }
    source = JSON.dump(books_list)
    File.write('books_list.json', source)
  end

  def dump_people
    people = @people.map do |p|
      [
        p.class, p.id,
        p.age, p.name,
        p.instance_of?(Student) ? p.classroom : p.specialization
      ]
    end
    source = JSON.dump(people)
    File.write('people.json', source)
  end

  def dump_rentals
    rentals = @rentals.map { |ren| [ren.date, ren.book.id, ren.person.id] }
    source = JSON.dump(rentals)
    File.write('rentals.json', source)
  end

  def load_books_list
    return unless File.exist?('books_list.json')

    books_list = JSON.parse(File.read('books_list.json'))
    books_list.each do |book|
      obj = Book.new(*book[1..])
      obj.id = book.first
      @books_list << obj unless @books_list.include?(obj)
    end
  end

  def load_people
    return unless File.exist?('people.json')

    people = JSON.parse(File.read('people.json'))
    people.each do |person|
      obj = if person.first == 'Teacher'
              Teacher.new(*person[2..])
            else
              Student.new(person.last, *person[2..3])
            end
      obj.id = person[1]
      @people << obj unless @people.include?(obj)
    end
  end

  def load_rentals
    return unless File.exist?('rentals.json')

    rentals = JSON.parse(File.read('rentals.json'))
    rentals.each do |obj|
      book = @books_list.find { |b| b.id == obj[1] }
      person = @people.find { |p| p.id == obj.last }
      rental = Rental.new(obj.first, book, person)
      @rentals << rental unless @rentals.include?(rental)
    end
  end
end