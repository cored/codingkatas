require_relative './choco_feast'
describe Choco::Feast, '#chocolates_count' do 
  let(:attributes) do 
    [
      [3],
      [10,2,5],
      [12,4,4],
      [6,2,2]
    ]
  end
  let(:feast) { Choco::Feast.new(attributes) }

  context "#chocolates_count" do 
    it 'returns the amount of chocolates a person eats' do 
      expect(feast.chocolates_count).to eql [6,3,5] 
    end
  end

end
