require_relative '../classes/book'

@books = []

def list_books
  puts 'BOOKS'
  @books.each do |book|
    puts "#{'Publish Date:'.blue} #{book.publish_date}\n#{'Publisher:'.blue}     #{book.publisher}
#{'Cover State:'.blue} #{book.cover_state}"
    puts ''
    sleep(2)
  end
end
