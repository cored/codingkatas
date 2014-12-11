var expect = require("chai").expect;

function count(string) { 
  return string.split("").reduce(function(reduced, item) {
    reduced[item] != null ? reduced[item]++ : reduced[item] = 1;
    return reduced;
  }, {});
}

describe("Count UTF-8 characters in your string", function() { 
  it("returns an empty object for empty string", function() { 
    expect(count("")).to.deep.equal({});
  });

  it("returns the count of each character for a given string", function() { 
    expect(count("aba")).to.deep.equal({'a':2, 'b':1})
  });
});
