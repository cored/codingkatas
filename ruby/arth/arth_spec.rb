require 'minitest/autorun' 

module Arth 
  extend self 

  def call(expr)
    eval(expr)
  end
end

describe Arth do 
  it 'evaluates addition expression' do 
    Arth.("1 + 1").must_equal 2
  end

  it 'evaluates substraction' do 
    Arth.("1 - 1").must_equal 0
  end

  it 'evaluates multiplication' do 
    Arth.("1 * 2").must_equal 2 
  end

  it 'evaluates division' do 
    Arth.("1 / 1").must_equal 1
  end

  it 'evaluates mixed operators' do 
    Arth.("1 + 1 - 2").must_equal 0
    Arth.("2 / 2 + 3 * 4 - 6").must_equal 7
  end
end
