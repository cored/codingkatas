class Replacer
  def initialize(str)
    @str = str
  end

  def replace(dic)
  end
end

describe Replacer do 
  let(:replacer) { Replacer.new(str) }

  context 'when empty' do
    let(:str) { "" } 
    it 'returns an empty string' do 
      expect(replacer.replace("")).to eql ""
    end
  end

  context 'when a string is sent' do 
    let(:str) { "$temp$" }
    it 'returns the replacement between $$' do 
      expect(replacer.replace(%w{temp temporary})).to eql "temporary"
    end
  end

end
