class CreateAuthor
  def self.create_author(authors)
    puts 'Enter the first name of the author'
    first_name = gets.chomp
    puts 'Enter the las name of the author'
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    authors << author
    puts "\nAuthor created successfully"
  end
end
