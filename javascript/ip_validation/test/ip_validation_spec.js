var expect = require("chai").expect;

var isValidIP = function(str) { 
  return /^(([01]?\d\d?|2[0-4]\d|25[0-5])\.){3}([01]?\d\d?|2[0-4]\d|25[0-5])$/.test(str);
}

describe("Validate ip addresses", function() { 
  it("return false for empty string", function() { 
    expect(isValidIP("")).to.equal(false);
  });

  it("return false for null", function() { 
    expect(isValidIP(null)).to.equal(false);
  });

  it("return true for 1.2.3.4", function() { 
    expect(isValidIP("1.2.3.4")).to.equal(true);
  });

  it("return false for abc.xyz.abc.xyz", function() { 
    expect(isValidIP("abc.xyz.abc.xyz")).to.equal(false);
  });

  it("return false for 256.1.2.3", function() { 
    expect(isValidIP("256.1.2.3")).to.equal(false);
  });
});
