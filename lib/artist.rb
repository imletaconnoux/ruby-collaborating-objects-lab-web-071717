require 'pry'

class Artist

  attr_accessor :name, :songs

  @@all = []

  def save
    @@all << self
  end

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def self.find_or_create_by_name(artist_name)
     my_artist = Artist.all.find do |artist|
      artist.name == artist_name
    end
      if my_artist == nil
        artist_1 = Artist.new(artist_name)
        artist_1
      else
        my_artist
    end
  end

  def print_songs
    self.songs.each do |song|
      puts song.name
    end
  end




end
