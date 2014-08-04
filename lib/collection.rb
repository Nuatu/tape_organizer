class Collection

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
  def name
    @name
  end
  def tapes
    @tapes
  end
  def tape_list(input)
    Collection.all[input-1].tapes.each_with_index { | tape, index | puts "#{index + 1}. #{tape.artist} | #{tape.name} | #{tape.year}\n" }
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
