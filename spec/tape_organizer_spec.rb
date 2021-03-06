require 'rspec'
require './lib/collection'
require './lib/artist'
require './lib/tape'

describe 'Collection' do
  it 'creates a collection object' do
    test_collection = Collection.new('Nuatu')
    expect(test_collection).to be_an_instance_of Collection
    expect(test_collection.name).to eq 'Nuatu'
    expect(test_collection.tapes).to eq []
    expect(test_collection.tapes.length).to eq 0
  end

  it 'pushes new collection objects to Collection class array' do
    test_collection1 = Collection.new('Nuatu')
    test_collection2 = Collection.new('Marcus')
    test_collection1.save
    test_collection2.save
    expect(Collection.all[0].name).to eq 'Nuatu'
    expect(Collection.all[1].name).to eq 'Marcus'
    expect(Collection.all.length).to eq 2
  end

  it 'initializes each collection object with an empty array to hold tapes' do
    test_collection = Collection.new('Nuatu')
    test_collection.save
    expect(test_collection.tapes_list).to eq "This collection has no tapes"
  end

  it 'adds a tape to a collection' do
    test_collection = Collection.new('Nuatu')
    test_collection.save
    test_collection.add_tape('Oddisee', 'Rock Creek Park', 2012)
    expect(test_collection.tapes.length).to eq 1
  end

  it 'deletes a tape from a collection' do
    test_collection = Collection.new('Nuatu')
    test_collection.save
    test_collection.add_tape('Oddisee', 'Rock Creek Park', 2012)
    expect(test_collection.tapes.length).to eq 1
    test_collection.delete_tape(0)
    expect(test_collection.tapes.length).to eq 0
  end

  it 'lists all Tapes in a Collection' do
    test_collection = Collection.new('Nuatu')
    test_collection.save
    test_collection.add_tape('Oddisee', 'Rock Creek Park', 2012)
    test_collection.add_tape('Someone Else', 'Over There', 2010)
    expect(test_collection.tapes_list).to eq "\n1. Oddisee | Rock Creek Park | 2012\n2. Someone Else | Over There | 2010\n"
  end

  it 'lists all Artists in a Collection' do
    test_collection = Collection.new('Nuatu')
    test_collection.save
    test_collection.add_tape('Red Hot Chilli Peppers', 'Rock The Bells', 1999)
    test_collection.add_tape('Red Hot Chilli Peppers', 'Rock The Bells', 2006)
    test_collection.add_tape('Oddisee', 'Rock Creek Park', 2012)
    test_collection.add_tape('MF DOOM', 'Ski Mask', 2008)
    test_collection.add_tape('MF DOOM', 'Hawaii Surf', 2012)
    expect(test_collection.artist_list).to eq "\n1. Red Hot Chilli Peppers\n2. Oddisee\n3. MF DOOM\n"
  end

  it 'searches by artist name' do
    test_collection = Collection.new('Nuatu')
    test_collection.save
    test_collection.add_tape('Red Hot Chilli Peppers', 'Rock The Bells', 1999)
    test_collection.add_tape('Red Hot Chilli Peppers', 'Live at Red Rock', 2006)
    test_collection.add_tape('Oddisee', 'Rock Creek Park', 2012)
    test_collection.add_tape('MF DOOM', 'Ski Mask', 2008)
    test_collection.add_tape('MF DOOM', 'Hawaii Surf', 2012)
    expect(test_collection.artist_search('mF Doom')).to eq "\nTAPE BY ARTIST: MF DOOM, Ski Mask, 2008\nTAPE BY ARTIST: MF DOOM, Hawaii Surf, 2012"
  end

  it 'searches by album title' do
    test_collection = Collection.new('Nuatu')
    test_collection.save
    test_collection.add_tape('Red Hot Chilli Peppers', 'Rock The Bells', 1999)
    test_collection.add_tape('Red Hot Chilli Peppers', 'Live at Red Rock', 2006)
    test_collection.add_tape('Oddisee', 'Rock Creek Park', 2012)
    test_collection.add_tape('MF DOOM', 'Ski Mask', 2008)
    test_collection.add_tape('MF DOOM', 'Hawaii Surf', 2012)
    expect(test_collection.album_search('Blue Red Peppers')).to eq "\nSorry, this collection doesn't include any tapes with that title"
  end
end

describe 'Tape' do
  it 'creates a tape object' do
    test_tape = Tape.new('Oddisee', 'Rock Creek Park', 2012)
    expect(test_tape).to be_an_instance_of Tape
    expect(test_tape.artist).to eq 'Oddisee'
    expect(test_tape.title).to eq 'Rock Creek Park'
    expect(test_tape.year).to eq 2012
  end
end
