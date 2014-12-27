require 'minitest/autorun'

module RemoveOddHashes 
  extend self 

  def call(hashes, keya, keyb)
    hashes.reject { |hash| (hash[keya] + hash[keyb]).odd? }
  end
end

describe RemoveOddHashes do
  it 'removes hashes that are odd for single hash' do
    RemoveOddHashes.([{a: 1, b: 1}], :a, :b).must_equal [{a: 1, b: 1}]
  end

  it 'removes hashes that are odd for two items' do 
    RemoveOddHashes.([{a: 1, b: 2}], :a, :b).must_equal []
  end

  it 'removes hashes that are odd for more than two items' do 
    RemoveOddHashes.([ {a: 5, b: 5}, 
                       {a: 3, b: 4}, 
                       {a: 2, b: 0}, 
                       {a: 2, b: 1}], :a, :b).must_equal [{a: 5, b: 5}, {a: 2, b: 0}]
  end
end
