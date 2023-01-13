require_relative 'book'
require_relative 'student'
require_relative 'rental'
require_relative 'teacher'

class App
  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  # List books
  def list_books
    puts 'There are no books found, Please add book by selecting 4 at the mainmenu' if @books.empty?
    @books.each_with_index do |book, index|
      puts "(#{index + 1}) Book => Title: #{book.title}, Author: #{book.author}"
    end
  end

  # List people
  def list_people
    puts 'There are no people in the list. Please add users by selecting 2 at the mainmenu' if @people.empty?
    @people.each_with_index do |person, index|
      puts "(#{index + 1}) [#{person.class}] => Id: #{person.id}, Name: #{person.name}, Age: #{person.age}"
    end
  end

  # Add person
  def add_person()
    puts 'Select 1 to add a student(1) or 2 to add a teacher(2)? [Enter a number 1 or 2]: '
    cartegory = gets.chomp.to_i
    case cartegory
    when 1
      print 'Enter the student name: '
      name = gets.chomp
      print 'Enter the student\'s age: '
      age = gets.chomp
      @people.push(Student.new(age, 'classroom', name))
      puts "#{name.capitalize} was successfully added as a student"
    when 2
      print 'Enter the teacher name: '
      name = gets.chomp
      print 'Enter the teacher\'s age: '
      age = gets.chomp
      print 'Enter the teacher\'s specialization: '
      specialization = gets.chomp
      @people.push(Teacher.new(age, specialization, name))
      puts "#{name.capitalize} was successfully added as a teacher"
    end
  end

  # Add book
  def add_book
    puts 'Add a new book'
    print 'Enter the book title: '
    title = gets.chomp
    print 'Enter the book author: '
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts "#{title} book was added successfully"
  end

  # Add rental
  def add_rental()
    puts 'Select a book from the following list by entering the book number: '
    list_books
    book_number = gets.chomp.to_i
    puts 'Book selected'
    puts 'Select a person from the following list by entering the person\'s number: '
    list_people
    person_number = gets.chomp.to_i
    puts 'Person selected'
    print 'Date: '
    date = gets.chomp
    puts 'Rental date is successfully saved'
    @rentals.push(Rental.new(date, @people[person_number - 1], @books[book_number - 1]))
    puts 'Rental added successfully'
  end

  # List rentals for a given person using id
  def list_rentals
    print 'Enter Person\'s ID: '
    id = gets.chomp
    puts 'List of all the rented books: '
    @rentals.each do |rental|
      if rental.person.id == id
        puts "Person: #{rental.person.name}
        Date: #{rental.date},
        Book '#{rental.book.title}' Author: #{rental.book.author}"
      else
        puts 'Checking database......'
        puts 'No rentals found'
      end
    end
  end

  # Main menu list method
  def main_menu
    puts 'Main menu'
    puts 'Please choose an option by entering a number:
        1 - List all Books
        2 - List all People
        3 - Add a Student/Teacher
        4 - Add a book
        5 - Add a rental
        6 - List all rentals by id
        7 - Exit Library'
    puts 'Waiting for Selection...'
  end

  # Handle main menu selction
  # rubocop:disable Metrics/CyclomaticComplexity
  def menu_selection
    main_menu
    selected = gets.chomp.to_i
    case selected
    when 1
      list_books
    when 2
      list_people
    when 3
      add_person
    when 4
      add_book
    when 5
      add_rental
    when 6
      list_rentals
    when 7
      puts 'Thank you for using OOP school Library, See you soon'
      exit
    end
    menu_selection
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
