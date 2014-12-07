var assert = require('assert');

function twoSum(numbers, target) { 
  var result = [];
  for (var idx = 0; idx < numbers.length; idx++) { 
    for (var jdx = idx+1; jdx < numbers.length; jdx++) { 
      if ((numbers[idx] + numbers[jdx]) === target) { 
        result = [idx, jdx];
        break;
      }
    }
  }
  return result;
}


describe('TwoSum', function() { 
  function numericalCompare(a,b) { 
    return a - b;
  }

  it('returns the indexes for the sum of 4', function() { 
    assert.deepEqual(twoSum([1,2,3],4).sort(numericalCompare), [0,2]);
  })
});

