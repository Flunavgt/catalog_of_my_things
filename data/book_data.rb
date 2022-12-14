require 'json'
require_relative '../classes/book'
require_relative '../classes/label'
require_relative '../app'

def load_books
  return unless File.exist?('./data/book.json')

  file = File.open('./data/book.json')

  if file.size.zero?
    'nothing saved yet.'
  else
    books = JSON.parse(File.read('./data/book.json'))

    books.each do |book|
      books = Book.new(book['publish_date'], book['publisher'], book['cover_state'])
      @books << books
    end
  end
  file.close
end

def load_labels
  return unless File.exist?('./data/labels.json')

  file = File.open('./data/labels.json')

  if file.size.zero?
    'nothing saved yet.'
  else
    labels = JSON.parse(File.read('./data/labels.json'))

    labels.each do |label|
      label = Label.new(label['title'], label['color'])
      @labels << label
    end
  end
  file.close
end

def save_book(publish_date, publisher, cover_state)
  obj = {
    publish_date: publish_date,
    publisher: publisher,
    cover_state: cover_state
  }

  return unless File.exist?('./data/book.json')

  file = File.open('./data/book.json')

  if file.size.zero?
    book = [obj]
  else
    book = JSON.parse(File.read('./data/book.json'))
    book << obj
  end

  file.close

  File.write('./data/book.json', JSON.pretty_generate(book))
end

def save_label(title, color)
  obj = {
    title: title,
    color: color
  }

  return unless File.exist?('./data/labels.json')

  file = File.open('./data/labels.json')

  if file.size.zero?
    label = [obj]
  else
    label = JSON.parse(File.read('./data/labels.json'))
    label << obj
  end

  file.close

  File.write('./data/labels.json', JSON.pretty_generate(label))
end
