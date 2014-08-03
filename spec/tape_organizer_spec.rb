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
