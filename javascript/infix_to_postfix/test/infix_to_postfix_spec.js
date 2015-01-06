var expect = require("chai").expect

var toPostfix = function(infix) { 
  return infix.match(/\d/g).join("") + infix.match(/[\*\+]/g).reverse().join("");
}

describe("Infix to postfix converter", function() { 
  it("Converts 2+7*5 in postfix notation", function() { 
    expect(toPostfix("2+7*5")).to.equal("275*+");
  });
});

