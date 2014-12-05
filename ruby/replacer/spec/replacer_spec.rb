require_relative 'replacer'

describe Replacer, '.evaluate' do 

  it 'returns proper evaluation for a single variable' do 
    expect(
      "Hello {$name}".extend(Replacer).evaluate('name' => 'Rafael')
    ).to eql "Hello Rafael"
  end

  it 'returns proper evaluation for multiple variables' do 
    expect(
      "Hello {$firstname} {$lastname}".extend(Replacer).evaluate('firstname' => 'Rafael', 'lastname' => 'George')
    ).to eql "Hello Rafael George"
  end

  context 'error handling' do 
    it 'throws an exception with variable doesnt exists' do 
      expect { 
        "Hello {$name}".extend(Replacer).evaluate({})
      }.to raise_error(ReplacerError)
    end
  end


end
