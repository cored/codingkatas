var assert = require('assert');

function twoSum(numbers, target) { 
  for (var idx = 0; idx < numbers.length; idx++) { 
    for (var jdx = idx+1; jdx < numbers.length; jdx++) { 
      if ((numbers[idx] + numbers[jdx]) === target) { 
        return [idx, jdx];
      }
    }
  }
  return [];
}


describe('TwoSum', function() { 
  function numericalCompare(a,b) { 
    return a - b;
  }

  it('returns the indexes for the sum of 4', function() { 
    assert.deepEqual(twoSum([1,2,3],4).sort(numericalCompare), [0,2]);
  })

  it('returns the indexes for the sum of 14690', function() { 
    assert.deepEqual(twoSum([1234,5678,9012],14690).sort(numericalCompare), [1,2]);
  })

  it('returns the indexes for the sum of 4', function() { 
    assert.deepEqual(twoSum([2,2,3],4).sort(numericalCompare), [0,1]);
  })
});

