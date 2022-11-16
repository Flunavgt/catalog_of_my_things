require 'json'
require_relative './book'
require_relative './label'
require_relative '../app'

def load_books
  if File.exist?('./book.json')
    file = File.open('./book.json')

    if file.size.zero?
      'nothing saved yet.'
    else
      book = JSON.parse(File.read('./book.json'))

      book.each do |book|
        book = Book.new(book['publish_date'], book['publisher'], book['cover_state'])
        @books << book
      end
    end
    file.close
  end
end

def load_labels
  if File.exist?('./labels.json')
    file = File.open('./labels.json')

    if file.size.zero?
      'nothing saved yet.'
    else
      labels = JSON.parse(File.read('./labels.json'))

      labels.each do |label|
        label = Label.new(label['title'], label['color'])
        @labels << label
      end
    end
    file.close
  end
end

def save_book(publish_date, publisher, cover_state)
  obj = {
    publish_date: publish_date,
    publisher: publisher,
    cover_state: cover_state
  }

  if File.exist?('./book.json')
    file = File.open('./book.json')

    if file.size.zero?
      book = [obj]
    else
      book = JSON.parse(File.read('./book.json'))
      book << obj
    end

    file.close

    File.write('./book.json', JSON.pretty_generate(book))
  end
end

def save_label(title, color)
  obj = {
    title: title,
    color: color
  }

  if File.exist?('./labels.json')
    file = File.open('./labels.json')

    if file.size.zero?
      label = [obj]
    else
      label = JSON.parse(File.read('./labels.json'))
      label << obj
    end

    file.close

    File.write('./labels.json', JSON.pretty_generate(label))
  end
end
