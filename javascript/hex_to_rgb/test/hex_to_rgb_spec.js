var expect = require("chai").expect

describe("Convert a Hex String to RGB", function() { 
  it("colors for a passed hex code", function() { 
    expect(hexStringToRGB("#FF9933")).to.deep.equal({r:255, g:153, b:51});
  });
});
