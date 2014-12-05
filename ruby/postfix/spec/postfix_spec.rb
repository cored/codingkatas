require 'spec_helper'
describe PostFix, "#infix" do 

  context "returns the infix form for 2 + 5" do 
    it { expect("2 + 5".extend(PostFix).infix).to eq("2 5 +") }
  end

  context "returns the infix form for 3 * (2 + 5)" do 
    it { expect("3 * (2 + 5)".extend(PostFix).infix).to eq("3 2 5 + *") }
  end

end
