# require './lib/address_book'
require './lib/tape'
require './lib/artist'
require './lib/collection'

def main_menu
  loop do
    #Main menu block
    puts "\nTape Collection by Ruby"

    puts "
    ____________________________
  /|............................|
 | |:         NEW TAPE         :|
 | |:      What you got?       :|
 | |:     ,-.   _____   ,-.    :|
 | |:    ( `)) [_____] ( `))   :|
 |v|:     `-`   ' ' '   `-`    :|
 |||:     ,______________.     :|
 |||.....|::::o::::::o::::|.....|
 |^|....|:::O::::::::::O:::|....|
 |/`----------------------------|
 `.___/ /====/ /=//=/ /====/____/
      `--------------------'
"
    puts "Press '1' to create a new Collection"
    puts "Press '2' to access existing Collection(s)"
    # puts "Press '3' to add or delete a Tape"
    puts "Press 'q' to return to exit"
    main_choice = gets.chomp
    exit if main_choice == 'q'
    main_menu_selector(main_choice)
  end
end

def main_menu_selector(input)
  if input == '1'
    puts "Collection Name?"
    name = gets.chomp
    newCollection = Collection.new(name)
    newCollection.save
  elsif input == '2'
    if Collection.all.length == 0
      puts "\nSorry, you have no collections"
      return
    else
      puts "\nExisting Collections:"
    end
    Collection.all.each_with_index { |collection, index| puts "#{index + 1}. #{collection.name}" }
    puts "\nEnter a collection number to modify or press 'x' to exit"
    modify_choice = gets.chomp.to_i
    unless modify_choice == 'x'
      collection_editor(modify_choice)
    end
  end
end
def collection_editor(input)
  puts "\nYou're modifiying the collection: #{Collection.all[input - 1].name}\n}"
  puts "\nPress '1' to add a Tape"
  puts "Press '2' to delete a Tape"
  puts "Press '3' to list all Tapes in this Collection"
  puts "Press '4' to list all Artists"
  puts "Press '5' to search by Artist"
  puts "Press '6' to to search by Album"
  puts "Press 'm' to return to main menu"
  editing_choice = gets.chomp.to_i
  unless (editing_choice == 'm')
    if editing_choice == 1
      puts "\nArtist?"
      new_artist = gets.chomp
      puts "\nTitle?"
      new_title = gets.chomp
      puts "\nRelease year?"
      new_year = gets.chomp

      Collection.all[input-1].tapes << Tape.new(new_artist,new_title,new_year)
      collection_editor(input)

    # elsif editing_choice == 2
    #   puts "\nPhone?"
    #   new_phone = gets.chomp
    #   Collection.all[input-1].phones << Phone.new(new_phone)
    #   contact_editor(input)

    elsif editing_choice == 3
      puts "\n #{Collection.all[input-1]}"
      new_address = gets.chomp
      Collection.all[input-1].addresses << Address.new(new_address)
      contact_editor(input)

    elsif editing_choice == 4
      puts "\nEmail address to delete?"
      Collection.all[input-1].emails.each_with_index { | email, index | puts "#{index + 1}. #{email.email}" }
      deleted_email = gets.chomp.to_i
      Collection.all[input-1].emails.delete_at(deleted_email-1)
      contact_editor(input)

    elsif editing_choice == 5
      puts "\nPhone to delete?"
      Collection.all[input-1].phones.each_with_index { | phone, index | puts "#{index + 1}. #{phone.phone}" }
      deleted_phone = gets.chomp.to_i
      Collection.all[input-1].phones.delete_at(deleted_phone-1)
      contact_editor(input)

    elsif editing_choice == 6
      puts "\nAddress to delete?"
      Collection.all[input-1].addresses.each_with_index { | address, index | puts "#{index + 1}. #{address.address}" }
      deleted_address = gets.chomp.to_i
      Collection.all[input-1].addresses.delete_at(deleted_address-1)
      contact_editor(input)
    end
  end


end
main_menu
