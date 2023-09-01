require './book'
require './classroom'
require './teacher'
require './student'
require './person'
require './rental'

class App
  attr_accessor :people, :rentals, :books

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_all_books
    puts '#=> No books are available yet' if books.empty?
    books.each do |book|
      puts "#=> Title: #{book.title} Author: #{book.author}"
    end
    puts people.length
  end

  def list_all_people
    puts '#=> No person is available yet' if people.empty?
    people.each do |person|
      puts "#=> [#{person.class}] ID: #{person.id} Name: #{person.name} Age: #{person.age}"
    end
    puts people.length
  end

  def create_teacher
    print "Teacher's specialization: "
    specialization = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    teacher = Teacher.new(age, specialization, name)
    people << teacher
    puts ''
    puts '#=> Teacher created successfully'
  end

  def create_student
    print 'Age: '
    age = Integer(gets.chomp)
    print 'Name: '
    name = gets.chomp
    print 'Parent permission? [y/n]: '
    parent_permission = gets.chomp.downcase

    case parent_permission
    when 'n'
      people << Student.new(nil, age, name, parent_permission: false)
    when 'y'
      people << Student.new(nil, age, name, parent_permission: true)
    else
      '#=> Invalid option, please try again'
    end

    puts ''
    puts '#=> Student created successfully'
  end

  def create_person
    puts 'What kind of person do you want to create?'
    puts '1 - Student'
    puts '2 - Teacher'
    print 'Input number : '

    person_type = Integer(gets.chomp)

    case person_type
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    books << book
    puts ''
    puts '#=>  Book created successfully'
  end

  def create_rental
    return if books.empty? || people.empty?

    puts '#=> Select a book from the following list by number'

    books.each.with_index(1) { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    print '#=> Choose a book: '
    selected_book = Integer(gets.chomp) - 1

    puts '#=> Select a person from the following list by number (no id)'

    people.each.with_index(1) do |person, index|
      puts "#{index}) Name: #{person.name} Age: #{person.age} Id: #{person.id}"
    end
    print '#=> Choose a person: '
    selected_person = Integer(gets.chomp) - 1

    print 'Date: '
    selected_date = gets.chomp.to_s

    rentals << Rental.new(selected_date, books[selected_book], people[selected_person])

    puts ''
    print '#=>  Rental created successfully.'
  end

  def list_rentals
    print '#=> Enter the Person ID: '
    id = gets.chomp.to_i

    rentals.each do |rental|
      if rental.person.id == id
        puts "#=>  Date: #{rental.date}, Book: #{rental.book.title} Author: #{rental.book.author}"
      else
        puts '#=> Invalid id, please try again'
      end
    end
  end
end
