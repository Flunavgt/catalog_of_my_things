require_relative '../app'

class List
  def self.list_all_games(array)
    if array.empty?
      puts "\n You have no games saved"
    else
      array.each_with_index do |game, index|
        puts '------------------------------------------------------------'
        print "#{index} Game name: #{game.game_name} \n  Date published: #{game.publish_date} "
        print "\n  Archive status: #{game.archived} \n  Multiplayer status: #{game.multiplayer} "
        puts "\n  Last played: #{game.last_played}"
        puts "\n"
      end
      puts '------------------------------------------------------------'
    end
  end

  def self.list_all_authors(array)
    if array.empty?
      puts "\n You have no authors saved"
    else
      array.each do |author|
        puts " Author: #{author.first_name} #{author.last_name}"
      end
    end
  end
end
