module SimpleSentences
  extend self

  def call(args)
    args.reject! { |item| item =~ /\./ }
    "#{args.inject("") do |sentence, item| 
      item =~ /\w+/ ? sentence << " #{item}" : sentence << "#{item}"
    end.strip}."
  end
end

describe SimpleSentences do

  it 'add spaces between words' do
    expect(SimpleSentences.(['hello','world'])).to eql 'hello world.'
  end

  context 'commas in the middle of the array' do
    it 'doesnt add spaces between left word and comma' do
      expect(SimpleSentences.(['hello',',','cousin'])).to eql 'hello, cousin.'
    end
  end

  context 'dots' do 
    it 'returns only one dot at the end and not more' do 
      expect(SimpleSentences.(['hello', 'world', '.'])).to eql 'hello world.'
    end
  end

end
