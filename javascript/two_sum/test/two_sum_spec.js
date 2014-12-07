var assert = require('assert');

function twoSum(numbers, target) { 
  return [];
}
describe('TwoSum', function() { 
  it('returns the indexes for the sum of 4', function() { 
    assert.equal(twoSum([1,2,3],4).sort(function(a,b) { 
      return a - b;
    }), [0,2]);
  })
});
