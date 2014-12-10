var assert = require("assert");

function descendingOrder(number) { 
  return number.toString().split("").sort(function(a, b) { return b - a; }).join("");
}

describe("DescendingOrder", function() { 
  describe("#descendingOrder", function() { 
    it("returns 0 for 0", function() { 
      assert(descendingOrder(0), 0);
    });

    it("returns 987654321 for 123456789", function() { 
      assert(descendingOrder(123456789), 987654321);
    });
  })
});
