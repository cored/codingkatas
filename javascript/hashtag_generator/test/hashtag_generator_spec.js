var expect = require("chai").expect;

var generateHashtag = function(str) { 
  if (str.length === 0) 
    return false;

  var result = "#" + str.split(" ").map(function(word) { 
    return word.substring(0,1).toUpperCase() + word.substring(1);
  }).join("");

  return result.length < 140 ? result : false;
}

describe("Hashtag Generator", function() { 
  it("returns false for empty string", function() { 
    expect(generateHashtag("")).to.equal(false);
  });

  it("returns false for a hashtag longer than 140 characters", function() {   
    expect(generateHashtag("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")).to.equal(false)
  });

  it("returns proper hello hashtag", function() { 
    expect(generateHashtag("hello")).to.equal("#Hello");
  });

  it("returns proper hashtag for 'hello world'", function() { 
    expect(generateHashtag("hello world")).to.equal("#HelloWorld")
  });

  it("returns proper hashtag for 'Hello there thanks for trying my Kata'", function() { 
    expect(generateHashtag("Hello there thanks for trying my Kata")).to.equal("#HelloThereThanksForTryingMyKata")
  });

  it("returns proper hashtag for ' hello world'", function() { 
    expect(generateHashtag(" hello world")).to.equal("#HelloWorld");
  });
});
