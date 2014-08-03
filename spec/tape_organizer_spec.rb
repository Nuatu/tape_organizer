require 'rspec'
require './lib/collection'
require 'artist'
require 'tape'

describe 'Collection' do
  it 'creates a collection object' do
    test_collection = Collection.new('Sterling')
    expect(test_collection).to be_an_instance_of Collection
    expect(test_collection.name).to eq 'Sterling'
    expect(test_collection.tapes).to eq []
  end
end

describe 'Tape' do
  it 'creates a tape object' do
    test_tape = Tape.new('Oddisee', 'Rock Creek Park', 2012)
    expect(test_tape).to be_an_instance_of Tape
    expect(test_tape.artist).to eq "Oddisee"
    expect(test_tape.album_name).to eq "Rock Creek Park"
    expect(test_tape.release_year).to eq 2012
  end
end


