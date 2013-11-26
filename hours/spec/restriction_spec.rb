class Restriction < Struct.new(:day, :initial_hour, :end_hour)
  def to_s
    "#{day}"
  end
end

class Restrictions
  def initialize
    @restrictions = []
  end

  def <<(restriction)
    @restrictions << restriction
  end

  def print_pretty
    @restrictions.group_by do |restriction|
      "#{restriction.initial_hour} - #{restriction.end_hour}"
    end.map do |hours, restriction|
      "#{Formatter.new(hours, Days.new(restriction))}"
    end
  end

  class Formatter
    def initialize(hours, days)
      @hours = hours
      @days = days
    end

    def to_s
      "#{@days} #{@hours}"
    end
  end

  class Days
    def initialize(restrictions)
      @restrictions = restrictions
    end

    def to_s
      @restrictions.map { |restriction| restriction }.join ', '
    end
  end
end

describe Restrictions do 
  let(:restrictions) { Restrictions.new }

  it 'pretty print out the days and hours' do 
    restrictions << Restriction.new("Monday", "3:00", "4:00")
    restrictions << Restriction.new("Tuesday", "4:00", "5:00")

    restrictions.print_pretty.should == ["Monday 3:00 - 4:00", "Tuesday 4:00 - 5:00"]
  end

  it 'group days with similar hours' do 
    restrictions << Restriction.new("Monday", "3:00", "4:00")
    restrictions << Restriction.new("Tuesday", "4:00", "5:00")
    restrictions << Restriction.new("Wednesday", "4:00", "5:00")

    restrictions.print_pretty.should == ["Monday 3:00 - 4:00", "Tuesday, Wednesday 4:00 - 5:00"]
  end
end
