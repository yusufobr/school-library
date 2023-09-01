require './app'

def options
  puts ''
  puts 'Welcome to School Library App!'
  puts ''

  puts '1 - List all books',
       '2 - List all people',
       '3 - Create a person',
       '4 - Create a book',
       '5 - Create a rental',
       '6 - List all of rentals for a given person id',
       '7 - Exit'
  puts ''
  puts 'Please choose an option by entering a number: '
  print '#=> '
end

def select_option(app, num)
  case num
  when '1'
    app.list_all_books
  when '2'
    app.list_all_people
  when '3'
    app.create_person
  when '4'
    app.create_book
  when '5'
    app.create_rental
  when '6'
    app.list_rentals
  else
    puts ''
    puts '#=> Invalid option.(InvalidInputError)'
  end
end

def main
  app = App.new
  loop do
    options
    num = gets.chomp
    break if num == '7'

    select_option(app, num)
    puts "\n"
  end

  puts 'Goodbye'
end

main
