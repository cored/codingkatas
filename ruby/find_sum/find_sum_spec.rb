require 'minitest/autorun'

module FindSum
  extend self

  def call(array)
    array.each.with_index.inject(0) do |sum, (inner_array, idx)| 
      sum += inner_array[idx % array.size]
    end
  end
end

describe FindSum do

  it 'returns the diagonal sum for a two dimensional array of lenght 4' do
    example_array = [[1,0,0,0],
                     [0,1,0,0],
                     [0,0,1,0],
                     [0,0,0,1]]


    FindSum.(example_array).must_equal 4
  end

  it 'returns the diagonal sum for a two dimensional array of lenght 5' do
    example_array = [[1,0,0,0,0],
                     [0,1,0,0,0],
                     [0,0,1,0,0],
                     [0,0,0,1,0],
                     [0,0,0,0,1]
    ]

    FindSum.(example_array).must_equal 5
  end

end
