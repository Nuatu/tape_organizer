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
  it 'pushes new collection objects to Collection array' do
    test_collection1 = Collection.new('Nuatu')
    test_collection2 = Collection.new('Marcus')
    test_collection1.save
    test_collection2.save
    expect(Collection.all[0].name).to eq 'Nuatu'
    expect(Collection.all[1].name).to eq 'Marcus'
    expect(Collection.all.length).to eq 2
  end
  it 'lists all Tapes in a Collection' do
    test_collection = Collection.new('Nuatu')
    test_collection.save
    test_tape1 = Tape.new('Oddisee', 'Rock Creek Park', 2012)
    test_tape2 = Tape.new('Someone Else', 'Over There', 2010)
    expect(Collection.all[0].tape_list(0)).to eq "1. Oddisee | Rock Creek Park | 2012\n2. Someone Else | Over There | 2010"
  end
end

describe 'Tape' do
  it 'creates a tape object' do
    test_tape = Tape.new('Oddisee', 'Rock Creek Park', 2012)
    expect(test_tape).to be_an_instance_of Tape
    expect(test_tape.artist).to eq 'Oddisee'
    expect(test_tape.name).to eq 'Rock Creek Park'
    expect(test_tape.year).to eq 2012
  end


end


