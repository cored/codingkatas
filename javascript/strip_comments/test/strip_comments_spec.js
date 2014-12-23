var expect = require("chai").expect

var solution = function(str, markers) {
  return str.split(new RegExp("["+markers.join("|")+"]s*.*")).reduce(function(reduced, phrase) { 
    reduced.push(phrase.replace(/\s$/, ''));
    return reduced;
  }, []).join("");
}

describe("Strip comments", function() {
  it("remove comments for a single word", function() {
    expect(solution("apples #comment", ["#"])).to.equal("apples");
  });

  it("remove comments for two words", function() {
    expect(solution("apples, pears #comment", ["#"])).to.equal("apples, pears");
  });

  it("use more than one comment marker", function() {
    expect(solution("apples, pears #comment !and here", ["#", "!"])).to.equal("apples, pears");
  });

  it("more than one marker and new lines", function() {
    expect(solution("apples, pears # and bananas\ngrapes\nbananas !apples", ["#", "!"])).
      to.equal("apples, pears\ngrapes\nbananas");
  });
});
