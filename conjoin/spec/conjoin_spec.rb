class Array

  def conjoin(*parameters)
    separator = ' ' if parameters.empty?
    require 'pry'; binding.pry  
    self.join separator
  end

end

describe Array, '#conjoin' do 
  let(:values) { [1,2,3] }
  

  context 'without parameters' do 
    subject { values.conjoin } 

    it 'use space as default separator' do 
      expect( subject ).to eql "1 2 3"
    end
  end

  context 'passing two parameters' do 
    let(:parameters) { %w|, and| }
    subject { values.conjoin(parameters) } 
    
    it 'use the second parameters as the tail separator' do 
      expect(subject).to eql '1, 2 and 3'
    end
  end

end
