var assert = require("assert");

function squareDigits() {
  return 0;
}

describe("Square Every Digit", function() { 
  describe("#squareDigits", function() { 
    it("square all digits of a number", function() { 
      assert(squareDigits(9119), 811181);
    });
  });
});
