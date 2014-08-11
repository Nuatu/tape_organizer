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
    result = "\n"
    if self.tapes.length == 0
      result = "This collection has no tapes"
    else
      self.tapes.each_with_index do | tape, index |
        result +="#{index + 1}. #{tape.artist} | #{tape.title} | #{tape.year}\n"
      end
    end
    result
  end

  

end
