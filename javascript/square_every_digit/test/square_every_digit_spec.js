var assert = require("assert");

function squareDigits(num) {
  return num.toString().split("").map(function(n) { return parseInt(n)*parseInt(n) })
}

describe("Square Every Digit", function() { 
  describe("#squareDigits", function() { 
    it("square all digits of a number", function() { 
      assert(squareDigits(9119), 811181);
    });
  });
});
