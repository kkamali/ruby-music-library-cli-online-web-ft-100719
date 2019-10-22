class MusicLibraryController
  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end
  
  def call 
    user_input = nil 
    until user_input == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      user_input = gets.chomp
    end
  end
  
  def list_songs
    sorted = Song.all.sort{|song1, song2| song1.name <=> song2.name}
    sorted.each_with_index{|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  
  def list_artists
    sorted = Artist.all.sort{|artist1, artist2| artist1.name <=> artist2.name}
    sorted.each_with_index{|artist, index| puts "#{index + 1}. #{artist.name}"}
  end
  
  def list_genres
    sorted = Genre.all.sort{|genre1, genre2| genre1.name <=> genre2.name}
    sorted.each_with_index{|genre, index| puts "#{index + 1}. #{genre.name}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp
    artist = Artist.find_by_name(user_input)
    if artist 
      songs = artist.songs.sort{|song1, song2| song1.name <=> song2.name}
      songs.each_with_index{|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
    end
  end 
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp
  end 
end 