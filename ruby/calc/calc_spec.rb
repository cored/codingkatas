class Calc
  NUMBERS = {
    four: 4
  }

  def method_missing(method, *args)
    NUMBERS[method]
  end
end

describe Calc do

  context 'adding four plus five' do
    it 'returns 9' do
      expect(Calc.new.four.plus.five).to eql 9
    end
  end
end
