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
      output.each do |album|
        if album[1].downcase == input.downcase
          result = "\nALBUM DETAILS: " + album[0] + ", " + album[1] + ", " + album[2].to_s
        end
      end
    end
    result
  end

end
