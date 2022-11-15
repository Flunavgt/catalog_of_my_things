require_relative '../app'

class List
  def self.list_all_games(array)
    if array.empty?
      puts "\n You have no games saved"
    else
      array.each do |game|
        puts " Date published #{game.publish_date}, \n Archive status #{game.archived},
            \nMultiplayer status #{game.multiplayer} \nLast played #{game.last_played}"
        puts "\n"
        puts '--------------------------------'
      end
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
