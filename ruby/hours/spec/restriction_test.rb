require 'minitest/autorun'

class Restrictions #< Array
  def initialize
   @collection = []
  end

  def <<(restriction)
   @collection << restriction
  end

  def print_pretty
    result = []
    skip_iteration = nil
    @collection.each_with_index do |restriction,index|
      break if skip_iteration
      if @collection[index+1].nil?
        result << restriction.prettify
        break
      end
      unless similar_hours? restriction, @collection[index+1]
        result << restriction.prettify
        skip_iteration = false
      else
        element, skip_iteration = similar(restriction, index)
        result << element
      end
    end
    result
  end

  def similar(restriction, index)
    ["#{restriction.day}, #{@collection[index+1].day} #{restriction.start_hour} - #{restriction.end_hour}", true]
  end 

  def not_similar(restriction)
    [restriction.prettify, false]
  end

  def similar_hours?(r1, r2) 
    if (r1.start_hour == r2.start_hour && r1.end_hour == r2.end_hour)
      true
    else
      false
    end
  end
end

class Restriction
  attr_accessor :day, :start_hour, :end_hour
  def initialize(day, start_hour, end_hour)
    @day = day
    @start_hour = start_hour
    @end_hour = end_hour
  end

  def prettify
    "#{@day} #{@start_hour} - #{@end_hour}"
  end
end

describe Restrictions do
  before do
    @restrictions = Restrictions.new
  end

  it 'pretty print out the days and hours' do
    @restrictions << Restriction.new("Monday", "3:00", "4:00")
    @restrictions << Restriction.new("Tuesday", "4:00", "5:00")

    @restrictions.print_pretty.must_equal ["Monday 3:00 - 4:00", "Tuesday 4:00 - 5:00"]
  end

  it 'group days with similar hours' do
    @restrictions << Restriction.new("Monday", "3:00", "4:00")
    @restrictions << Restriction.new("Tuesday", "4:00", "5:00")
    @restrictions << Restriction.new("Wednesday", "4:00", "5:00")

    @restrictions.print_pretty.must_equal ["Monday 3:00 - 4:00", "Tuesday, Wednesday 4:00 - 5:00"]
  end
end
