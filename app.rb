require_relative './music/preserve_data'
require_relative './music/create_music_album'
require_relative './music/create_genre'
require_relative './music/music_album'
require_relative './music/lists'
require_relative './music/genre'
require_relative './item'
require_relative './game/author'
require_relative './game/create_game'
require_relative './game/game'
require_relative './game/create_author'
require_relative './game/list'
require_relative './game/preserve_author_game'
require_relative './options/add_book'
require_relative './options/list_books'
require_relative './options/list_lables'

class App
  attr_accessor :music_albums, :genres, :books, :labels, :games, :authors

  def initialize
    @books = []
    @labels = []
    @user_options = 0
    @genres = PreserveData.load_genres
    @music_albums = PreserveData.load_albums(@genres)
    @games = PreserveAuthorGame.load_games
    @authors = PreserveAuthorGame.load_authors
  end

  def load_data
    load_books
    load_labels
  end

  def list_options
    case @user_options
    when 1
      list_books
    when 2
      List.list_all_music_albums(@music_albums)
    when 3
      list_labels
    when 4
      list_all_genres
    when 5
      List.list_all_games(@games)
    when 6
      List.list_all_authors(@authors)

    end
  end

  def add_options
    case @user_options
    when 7
      add_book
      CreateAuthor.create_author(@authors)
      PreserveAuthorGame.store_author(@authors)
    when 8
      CreateMusicAlbum.create_music_album(@music_albums, @genres)
    when 9
      AlbumCreator.create_album(@music_albums, @genres)
    when 10
      CreateGame.create_game(@games)
      PreserveAuthorGame.store_games(@games)
    when 11
      exit_app
    else
      puts 'Enter a valid option (1 - 10)'
    end
  end

  def dashboard
    puts "
        Please choose an option by entering a number from below:\n
        [1] - List All Books
        [2] - List All Music Albums
        [3] - List All Labels
        [4] - List All Genres
        [5] - List All Games
        [6] - List All Authors
        [7] - Add a Book
        [8] - Add a Music Album
        [9] - Add a new Author
        [10] - Add a Game
        [11] - Exit

        Type your option"
    @user_options = gets.chomp.to_i
    list_options
    add_options
    dashboard
  end

  # def opt_sw
  #   show_menu
  #   menu_list = {
  #     '1' => @book.list_books,
  #     '2' => List.list_all_music_albums(@music_albums),
  #     '3' => @label.list_labels,
  #     '4' => List.list_all_genres(@genres),
  #     '5' => @game.list_games,
  #     '6' => @author.list_authors,
  #     '7' => @book.add_book,
  #     '8' => AlbumCreator.create_album(@music_albums, @genres),
  #     '9' => @game.add_game
  #   }

  #   menu = gets.chomp
  #   if menu.to_i <= 8
  #     menu_list[menu].call
  #   elsif menu == '0'
  #     puts 'Thank you, come back soon.'
  #   else
  #     opt_sw
  #   end
  # end

  # def show_menu
  #   puts "
  #       Please choose an option by entering a number from below:\n
  #       [1] - List All Books
  #       [2] - List All Music Albums
  #       [3] - List All Labels
  #       [4] - List All Genres
  #       [5] - List All Games
  #       [6] - List All Authors
  #       [7] - Add a Book
  #       [8] - Add a Music Album
  #       [9] - Add a Game
  #       [10] - Exit

  #       Type your option"
  # end

  def run
    system('clear')
    dashboard
  end

  def exit_app
    puts 'Thank you for using this app'
    PreserveData.store_albums(@music_albums)
    PreserveData.store_genres(@genres)
    # PreserveAuthorGame.store_games(@games)
    # PreserveAuthorGame.store_authors(@authors)
    exit
  end
end
