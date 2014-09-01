require 'pathname'
require 'minitest/autorun'

describe Pathname do 

  describe '.getwd' do 
    it 'returns working directory' do 
      Pathname.getwd.to_s.must_equal '/home/homer/code/ruby/katas/pathname'
    end
  end

  describe '.glob' do 
    it 'returns a list of pathname objects pointing to a particular directory' do 
      Pathname.glob('.').map(&:to_s).must_equal %w|.|
    end
  end

  describe '.pwd' do 
    it 'prints the working directory' do 
      Pathname.pwd.to_s.must_equal '/home/homer/code/ruby/katas/pathname'
    end
  end

  describe '#+' do 
    it 'adds two pathnames' do 
      p1 = Pathname.new('.')
      p2 = Pathname.new('.')
      p1.+(p2).to_s.must_equal '.'
    end
  end

  describe '#absolute?' do 
    it 'returns true or false if the pathname is an absolute path' do 
      Pathname.new('/home/homer/code/katas').absolute?.must_equal true
    end
  end

  describe '#ascend' do 
    it '' do 
      Pathname.new('/home/homer/code').ascend { |i| i }.to_s.must_equal ''
    end
  end

end
