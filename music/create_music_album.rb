class AlbumCreator
  @user_input = ''

  def self.switch_case(ans)
    case ans
    when 'y'
      true
    when 'n'
      false
    else
      puts "Please Enter Y/y for 'YES' and N/n for 'No' \n Answer: "
      answer = gets.chomp.downcase
      switch_case(answer)
    end
  end

  def self.create_album(music_albums, genres)
    system('cls')
    system('clear')
    puts 'Is the album on spotify? [Y | N]'.magenta.bold.underline
    print 'Answer: '
    user_answer = gets.chomp.downcase
    puts "\nAlbum title".magenta.bold.underline
    print 'Answer: '
    album_title = gets.chomp
    puts "\nArtist".magenta.bold
    print 'Answer: '
    artist = gets.chomp
    @on_spotify = AlbumCreator.switch_case(user_answer)

    album = MusicAlbum.new(album_title, @on_spotify, artist)

    new_genre = GenreCreator.new
    album.genre = new_genre.create_genre(genres)
    music_albums << album
    puts "\nMusic album created successfully".green
    sleep(2)
    system('cls')
    system('clear')
  end
end
