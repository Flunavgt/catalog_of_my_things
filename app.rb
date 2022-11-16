require_relative './music/preserve_data'
require_relative './music/create_music_album'
require_relative './music/create_genre'
require_relative './music/music_album'
require_relative './music/lists'
require_relative './music/genre'
require_relative './item'
require_relative './options/add_book'
require_relative './options/list_books'
require_relative './options/list_lables'
require 'colorize'

class App
  attr_accessor :music_albums, :genres, :books, :labels, :games, :authors

  def initialize
    @books = []
    @labels = []
    @user_options = 0
    @genres = PreserveData.load_genres
    @music_albums = PreserveData.load_albums(@genres)
    
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
    when 6

    end
  end

  def add_options
    case @user_options
    when 7
      add_book
      CreateAuthor.create_author(@authors)
      PreserveAuthorGame.store_author(@authors)
    when 8
      AlbumCreator.create_album(@music_albums, @genres)
    when 9
      CreateGame.create_game(@games)
      PreserveAuthorGame.store_games(@games)
    when 10
      exit_app
    else
      puts 'Enter a valid option (1 - 10)'
    end
  end

  def dashboard
    puts 'Please choose an option by entering a number from below:'.colorize(:red)
    puts "
        [1] - List All Books
        [2] - List All Music Albums
        [3] - List All Labels
        [4] - List All Genres
        [5] - List All Games
        [6] - List All Authors
        [7] - Add a Book
        [8] - Add a Music Album
        [9] - Add a Game
        [10] - Exit

        Type your option"
    @user_options = gets.chomp.to_i
    list_options
    add_options
    dashboard
  end

  def run
    system('clear')
    dashboard
  end

  def exit_app
    puts 'Thank you for using this app'
    PreserveData.store_albums(@music_albums)
    PreserveData.store_genres(@genres)
    exit
  end
end
