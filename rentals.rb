class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date

    # a rental belongs to book
    @book = book
    book.rentals << self

    # rental belongs to person
    @person = person
    person.rentals << self
  end
end
