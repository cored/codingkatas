var expect = require("chai").expect;

var getCount = function(str) { 
  var re = new RegExp("a|e|i|o|u", "g");
  var amount = str.match(re);
  return Array.isArray(amount) ? amount.length : 0;
}

describe("Vowel count", function() { 
  it("returns 0 for non vowel string", function() { 
    expect(getCount("pyx")).to.equal(0);
  });

  it("returns 1 for a", function() { 
    expect(getCount("a")).to.equal(1);
  })

  it("returns 2 for ae", function() { 
    expect(getCount("ae")).to.equal(2);
  })

  it("returns 3 for aei", function() { 
    expect(getCount("aei")).to.equal(3);
  })

  it("returns 4 for aeio", function() { 
    expect(getCount("aeio")).to.equal(4);
  })

  it("returns 5 for aeiou", function() { 
    expect(getCount("aeiou")).to.equal(5);
  })
})
