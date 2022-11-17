require 'rspec'
require_relative '../music/music_album'

describe MusicAlbum do
  context 'Testing Music album' do
    it 'instance of MusicAlbum' do
      album = MusicAlbum.new('Toto', 'greatest', true)
      expect(album).to be_instance_of(MusicAlbum)
    end
    it 'canbe archived method ' do
      album = MusicAlbum.new('Toto', 'greatest', true)
      expect(album.can_be_archived?).to eq(false)
    end
    it 'is a child of Item' do
      album = MusicAlbum.new('Toto', 'greatest', true)
      expect(album).to be_kind_of(Item)
    end
    it 'creates a new album ' do
      album = MusicAlbum.new('Toto', 'greatest', true)
      expect(album.on_spotify).to eq(true)
    end
    it 'can be archived method' do
      album = MusicAlbum.new('Toto', 'greatest', false)
      expect(album.can_be_archived?).to eq(false)
    end
  end
end
