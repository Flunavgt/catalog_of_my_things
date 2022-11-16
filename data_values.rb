module DataValues
  @albums = []
  @genres = []
  @authors = []
  @labels = []
  @artist = []
  @album_title = []
  @game_title = []

  def self.albums
    @albums
  end

  def self.genres
    @genres
  end

  def self.album_title
    @album_title
  end

  def self.artist
    @artist
  end

  def self.authors
    @authors
  end

  def game_title
    @game_title
  end
end
