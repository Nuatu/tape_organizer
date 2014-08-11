# require './lib/address_book'
require './lib/tape'
require './lib/artist'
require './lib/collection'

def main_menu
  loop do
    #Main menu block
    system "clear"
    puts "\nTape Collection !><! YA DIGG!"

    puts "
    ____________________________
  /|............................|
 | |:         NEW TAPE         :|
 | |:      #WHAT YOU GOT-?     :|
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
    puts "Press '1' CREATE a new Collection"
    puts "Press '2' EXISTING Collection(s)"
    # puts "Press '3' to add or delete a Tape"
    puts "Press 'x' Exit Program"
    input = gets.chomp
    exit if input == 'x'
    main_menu_selector(input)
  end
end

def main_menu_selector(input)
  if input == '1'
    puts "Collection Name?"
    name = gets.chomp
    newCollection = Collection.new(name)
    newCollection.save
    puts "**SAVED**"
  elsif input == '2'
    if Collection.all.length == 0
      puts "\nSorry, you have no collections"
      puts "\nWhat you waiting on - TIME == MONEY!"
      return
    else
      puts "\nExisting Collections:"
    end
    Collection.all.each_with_index { |collection, index| puts "#{index + 1}. #{collection.name}" }
    puts "\nEnter a collection number to modify or press 'x' to go back to Main Menu"
    input = gets.chomp.to_i
    unless input == 0 or input > Collection.all.length
      collection_editor(input)
    end
    main_menu
  end
end

def collection_editor(input)
  puts "\nYou're modifiying the collection: #{Collection.all[input - 1].name}\n"
  puts "\nPress '1' to ADD a TAPE"
  puts "Press '2' to DELETE a TAPE"
  puts "Press '3' to LIST all TAPES in this Collection"
  puts "Press '4' to LIST all ARTISTS"
  puts "Press '5' to SEARCH by ARTIST"
  puts "Press '6' to to SEARCH by ALBUM"
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
      Collection.all[input-1].add_tape(new_artist,new_title,new_year)
      puts "**SAVED**"
      collection_editor(input)

    elsif editing_choice == 2
      puts Collection.all[input-1].tapes_list
      puts "Tape number?"
      choice = gets.chomp
      Collection.all[input-1].delete_tape(choice)
      collection_editor(input)

    elsif editing_choice == 3
      puts Collection.all[input-1].tapes_list

      collection_editor(input)

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
