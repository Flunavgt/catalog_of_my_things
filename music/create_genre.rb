class GenreCreator
  def create_genre(genres)
    puts "\nAlbum genre?".magenta.bold.underline
    print 'Answer: '
    @name = gets.chomp
    genre = Genre.new(@name)
    genres << genre
    genre
  end
end
