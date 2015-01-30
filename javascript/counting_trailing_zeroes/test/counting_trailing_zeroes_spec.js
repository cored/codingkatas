var expect = require("chai").expect;

var countTrailingZeroes = function(number) {
  var pow = 1;
  var amount = 0;
  while ((number / Math.pow(5, pow)) > 1) { 
    amount += (number / Math.pow(5, pow));
    pow += 1;
  }
  return Math.floor(amount);
}

describe("Counting trailing zeroes", function() { 
  it("calculates the trailing zeroes for 12", function() { 
    expect(countTrailingZeroes(12)).to.equal(2);
  });

  it("calculates the trailing zeroes for 1000", function() { 
    expect(countTrailingZeroes(1000)).to.equal(249);
  });
});
