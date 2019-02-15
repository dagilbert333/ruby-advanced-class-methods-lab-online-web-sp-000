class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
  def self.create
    song = self.new 
    @@all << song
    song
  end
  
  def self.new_by_name(string_name)
    song = self.new
    song.name = string_name
    song 
  end
  
  def self.create_by_name(string_name)
    song = self.new
    song.name = string_name
    song.save
    song
  end
  
  def self.find_by_name(string_name)
    @@all.find{|song| song.name == string_name}
  end

  def self.find_or_create_by_name(search_this_song)
    found_song = self.find_by_name(search_this_song)
      if found_song == nil 
         self.create_by_name(search_this_song)
      else
         found_song
      end
  end
  
  def self.alphabetical
    @@all.sort_by! {|a| a.name }
  end
  
  def self.new_from_filename(filename)
    artist_and_song = filename.split(" - ")
    artist_and_song[1].slice! ".mp3"
    artist_name = artist_and_song[0]
    song_name = artist_and_song[1]
    song = self.new
    song.artist_name = artist_name
    song.name = song_name
    song
  end
  
  def create_from_filename
    
  end
  
  def save
    self.class.all << self
  end

end
