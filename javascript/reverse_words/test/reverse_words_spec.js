var expect = require("chai").expect

var reverseWords = function(str) { 
  return str.split(/\s/).map(function(word) { 
    return word.split("").reverse().join("");
  }).join(" ");
}

describe("Reverse words", function() { 
  it("reverse a list of words", function() { 
    expect(reverseWords("This is an example!")).to.equal("sihT si na !elpmaxe");
  });
});
