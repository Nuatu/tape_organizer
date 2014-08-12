require 'set'

class Collection

  attr_accessor :collections, :name, :tapes

  @@collections = []

  def initialize(name)
    @name = name
    @tapes = []
  end

  def Collection.all
    @@collections
  end

  def save
    @@collections << self
  end

  def add_tape(new_artist,new_title,new_year)
    self.tapes << Tape.new(new_artist,new_title,new_year)
  end

  def delete_tape(choice)
    self.tapes.delete_at(choice)
  end

  def tapes_list
    output = "\n"
    if self.tapes.length == 0
      output = "This collection has no tapes"
    else
      self.tapes.each_with_index do | tape, index |
        output +="#{index + 1}. #{tape.artist} | #{tape.title} | #{tape.year}\n"
      end
    end
    output
  end

  def artist_list
    output = "\n"
    if self.tapes.length == 0
      output = "This collection has no tapes"
    else
      result = Set.new
      self.tapes.each do | tape |
        result.merge([tape.artist])
      end
      result.each_with_index do |artist, index|
        output +="#{index + 1}. #{artist}\n"
      end
    end
    output
  end

  def artist_search(input)
    output = "\n"
    if self.tapes.length == 0
      output = "This collection has no tapes"
    else
      result = Set.new
      self.tapes.each do | album |
        result.merge([[album.artist, album.title, album.year]])
      end
      output = result
      result1 = ""
      output.each do |album|
        if album[0].downcase == input.downcase
          result1 += "\nTAPE BY ARTIST: " + album[0] + ", " + album[1] + ", " + album[2].to_s
        end
      end
      if result.length < 1
        result1 = "\nSorry, this collection doesn't have any tapes by that artist"
      end
    end
    result1
  end

  def album_search(input)
    output = "\n"
    if self.tapes.length == 0
      output = "This collection has no tapes"
    else
      result = Set.new
      self.tapes.each do | album |
        result.merge([[album.artist, album.title, album.year]])
      end
      output = result
      result1 = ""
      output.each do |album|
        if album[1].downcase == input.downcase
          result1 = "\nTAPE DETAILS: " + album[0] + ", " + album[1] + ", " + album[2].to_s
        else
        result1 = "\nSorry, this collection doesn't include any tapes with that title"
        end
      end
    end
    result1
  end

end
