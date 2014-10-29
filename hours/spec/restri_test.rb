class Restrictions

  def initialize 
    @restrictions = []
  end

  def print_pretty
    @restrictions.map(&:print_pretty)
  end

  def << restriction
    @restrictions << restriction
  end

end


class Restriction

  def initialize day, start, finish
    @day     = day
    @start   = start
    @finish  = finish
  end

  def print_pretty
    "#{@day} #{@start} - #{@finish}"
  end

  def to_h
    {
      day: @day,
      start: @start,
      finish: @finish
    }
  end
end


require 'minitest/autorun'

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
