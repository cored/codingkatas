var expect = require("chai").expect 

var solution = function(str, markers) { 
  return markers.reduce(function(reduced, marker) { 
    reduced.push(str.substring(0, str.indexOf(marker)));
    return reduced;
  }, []).join().trim();
}

describe("Strip comments", function() { 
  it("remove comments for a single word", function() { 
    expect(solution("apples #comment", ["#"])).to.equal("apples");
  });

  it("remove comments for two words", function() { 
    expect(solution("apples, pears #comment", ["#"])).to.equal("apples, pears");
  });
});
