var expect = require("chai").expect;

var addLength = function(words) {
  return words.split(" ").map(function(word) {
    return word + " " + word.length;
  });
};

describe("Add length", function() {
  it("Add the length of each word added to each item", function() {
    expect(addLength("apple ban")).to.deepEqual(["apple 5", "ban 3"]);
  });
});
