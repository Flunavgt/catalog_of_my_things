class CreateAuthor
  def self.create_author(authors)
    puts 'Enter the first name of the author'.magenta.bold.underline
    first_name = gets.chomp
    puts "\nEnter the las name of the author".magenta.bold.underline
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    authors << author
    puts "\nAuthor created successfully".green
    sleep(2)
    system('cls')
    system('clear')
  end
end
