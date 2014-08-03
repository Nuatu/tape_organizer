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

  # def collections_list
  #   result = ""
  #   @collections.each do |email_object|
  #     if result == ""
  #       result += "| " + email_object.email + " | "
  #     else
  #       result += email_object.email + " |"
  #     end
  #   end
  #   result
  # end

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
