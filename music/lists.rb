require_relative '../app'

class List
  def self.list_all_music_albums(array)
    if array.empty?
      puts "\n You have no music albums saved"
    else
      array.each do |album|
        puts "\n        #{'Album Information'.green.underline}
        #{'Date published:'.blue} #{album.publish_date}
        #{'Artist:'.blue}         #{album.artist}
        #{'Title:'.blue}          #{album.album_title}
        #{'Archive status:'.blue} #{album.archived}
        #{'Spotify status:'.blue} #{album.on_spotify}"
        puts ''
        sleep(2)
      end
    end
  end

  def self.list_all_genres(array)
    if array.empty?
      puts "\n You have no genres albums saved"
    else
      array.each do |genre|
        puts "Available Genres: #{genre.name}"
      end
    end
  end
end
