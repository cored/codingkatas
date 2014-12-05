class Equilibrium

  def solution(values)
    indexes = []
    values.each_with_index do |item, idx|
      if values.take(idx).inject(0) { |s, i| s += i } == values.reverse.take(idx).inject { |s, i| s += i } && idx > 1 
        indexes << idx 
      end
      require 'pry'; binding.pry  
    end
    indexes
  end

end

describe Equilibrium do 
  subject { Equilibrium.new.solution(values) } 

  context "first case" do 
    let(:values) { [-7, 1, 5, 2, -4, 3, 0] }
    it "returns the equilibrium indexes for a given array" do 
      subject.should == [3, 6]
    end
  end

end
