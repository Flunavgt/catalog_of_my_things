require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name, :album_title, :artist

  def initialize(album_title, artist, on_spotify, id: nil, publish_date: nil)
    super(id, publish_date)
    @id = id || SecureRandom.random_number(1000)
    @album_title = album_title
    @artist = artist
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
