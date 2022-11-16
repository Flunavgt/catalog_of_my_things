require 'json'

class PreserveAuthorGame
  def self.store_author(authors)
    data = []
    file = './authors.json'
    authors.each do |author|
      data << { first_name: author.first_name, last_name: author.last_name }
    end
    File.write(file, JSON.pretty_generate(data))
  end

  def self.load_authors
    file = './authors.json'
    data = []
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |author|
        saved_author = Author.new(author['first_name'], author['last_name'])
        saved_author.id = author['id']
        data << saved_author
      end
    end
    data
  end

  def self.store_games(games)
    data = []
    file = './games.json'
    games.each do |game|
      data << { publish_date: game.publish_date, id: game.id, archived: game.archived,
                multiplayer: game.multiplayer, last_played: game.last_played, game_name: game.game_name }
    end
    File.write(file, JSON.pretty_generate(data))
  end

  def self.load_games
    file = './games.json'
    data = []
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |game|
        saved_game = Game.new(game['multiplayer'], game['last_played'], game['game_name'])
        saved_game.id = game['id']
        data << saved_game
      end
    end
    data
  end
end
