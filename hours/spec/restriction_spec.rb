describe Restrictions do 
  let(:restrictions) { Restrictions.new }

  it 'pretty print out the days and hours' do 
    restrictions << Restriction.new("Monday", "3:00", "4:00")
    restrictions << Restriction.new("Tuesday", "4:00", "5:00")

    restrictions.print_pretty.should == ["Monday 3:00 - 4:00", "Tuesday 4:00 - 5:00"]
  end

  pending 'group days with similar hours' do 
    restrictions << Restriction.new("Monday", "3:00", "4:00")
    restrictions << Restriction.new("Tuesday", "4:00", "5:00")
    restrictions << Restriction.new("Wednesday", "4:00", "5:00")

    restrictions.print_pretty.should == ["Monday 3:00 - 4:00", "Tuesday, Wednesday 4:00 - 5:00"]
  end
end
