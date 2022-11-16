require 'date'
require_relative '../item'

class Game < Item
  attr_accessor :multiplayer, :last_played, :game_name

  def initialize(multiplayer, last_played, game_name, id: nil, publish_date: nil)
    super(id, publish_date)
    @multiplayer = multiplayer
    @last_played = last_played
    @game_name = game_name
  end

  private

  def can_be_archived?
    super && DateTime.now.strftime('%Y').to_i - @last_played[6..10].to_i > 2
  end
end
