var expect = require("chai").expect

var hexStringToRGB = function(hex) { 
  var decimal_values = hex.match(/\w{1,2}/g).map(function(code) { 
    return parseInt(code, 16);
  })

  return {r: decimal_values[0], g: decimal_values[1], b: decimal_values[2]};
}

describe("Convert a Hex String to RGB", function() { 
  it("colors for a passed hex code", function() { 
    expect(hexStringToRGB("#FF9933")).to.deep.equal({r:255, g:153, b:51});
  });
});
