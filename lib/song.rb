require 'pry'
class Song
  @@count = 0
  @@artists = []
  @@genres = []
  @@songs = {}

  def initialize ( name, artist, genre )
    @name = name
    @artist = artist
    @genre = genre
    @@count +=1
    @@artists << artist
    @@genres << genre
    @@songs.merge!( { name => [ artist, genre ] } )
  end

  attr_accessor :name, :artist, :genre

  def self.count
    @@count
  end

  def self.artists
    @@artists.uniq
  end

  def self.genres
    @@genres.uniq
  end

  def self.artist_count
    artist_count = self.artists.map do |artist|
      count = 0
      @@songs.each do |song, info|
        if info.include?(artist)
          count +=1
        end
      end
      [artist, count]
    end
    artist_count.to_h
  end

  def self.genre_count
    genre_count = self.genres.map do |genre|
      count = 0
      @@songs.each do |song, info|
        if info.include?(genre)
          count +=1
        end
      end
      [genre, count]
    end
    genre_count.to_h
  end
end
