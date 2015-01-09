var expect = require("chai").expect 

var power = function(list) { 
  return list.reduce(function(result, num) { 
    result = result.concat(result.map(function(item) { 
      return item.concat([num]);
    }));

    return result;
  }, [[]]);
}

describe("Calculates the sub lists of a list", function() { 
  it("Returns the empty set for empty list", function() { 
    expect(power([])).to.deep.equal([[]]);
  });

  it("Returns sets for one item", function() { 
    expect(power([1])).to.deep.equal([[], [1]]);
  });

  it("Returns set for two items", function() { 
    expect(power([1,2])).to.deep.equal([[], [1], [2], [1,2]]);
  });

  it("Returns set for three items", function() {
    expect(power([1,2,3])).to.deep.equal([[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]);
  });

});
