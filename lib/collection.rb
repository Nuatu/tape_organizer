class Collection

  attr_accessor :collections, :name, :tapes
  # attr_reader

   @@collections = []

  def initialize(name)
    @name = name
    @tapes = []
  end

  def Collection.all
    @@collections
  end

  def Collection.clear
    @@collections = []
  end

  def save
    @@collections << self
  end

  def tapes_list
    result = ""
    if self.tapes.length == 0
      result = "\nThis collection has no tapes"
    else
      self.tapes.each_with_index do | tape, index |
        result +="#{index + 1}. #{tape.artist} | #{tape.title} | #{tape.year}\n"
      end
    end
    result
  end

  # def phone_list
  #   result = ""
  #   @phones.each do |phone_object|
  #     if result == ""
  #       result += "| " + phone_object.phone + " | "
  #     else
  #       result += phone_object.phone + " |"
  #     end
  #   end
  #   result
  # end

  # def address_list
  #   result = ""
  #   @addresses.each do |address_object|
  #     if result == ""
  #       result += "| " + address_object.address + " | "
  #     else
  #       result += address_object.address + " |"
  #     end
  #   end
  #   result
  # end
end
