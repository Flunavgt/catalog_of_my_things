require_relative '../classes/book'
require_relative '../classes/label'
require_relative '../data/book_data'

@books = []
@labels = []

def add_book
  system('cls')
  system('clear')
  puts 'Enter publisher'.magenta.bold.underline
  publisher = gets.chomp
  puts "\nEnter publish date in format (DD-MM-YYYY)".magenta.bold.underline
  publish_date = gets.chomp
  puts "\nEnter the cover state".magenta.bold.underline
  cover_state = gets.chomp
  puts "\nEnter title".magenta.bold.underline
  title = gets.chomp
  puts "\nEnter color".magenta.bold.underline
  color = gets.chomp
  new_book = Book.new(publish_date, publisher, cover_state)
  @books.push(new_book)
  save_book(new_book.publish_date, new_book.publisher, new_book.cover_state)

  new_label = Label.new(title, color)
  @labels.push(new_label)
  save_label(new_label.title, new_label.color)
  puts 'BOOK AND LABEL CREATED SUCCESSFULLY'.green
  sleep(2)
  system('cls')
  system('clear')
end
