var expect = require('chai').expect;

var maskify = function(str) {
  if (str.length >= 4) {
    var replaceMent = str.substring(0, str.length-4);
    var maskSize = replaceMent.length;
    str = str.replace(replaceMent, [].concat.apply([],
          Array(maskSize)).map(function(_) { return "#"; }).join(''));
  }

  return str;
}

describe('Credit card mask', function() {
  it('returns empty string for empty', function() {
    expect(maskify("")).to.equal("");
  })

  it('returns the same string if less than 4 characters', function() {
    expect(maskify("1")).to.equal("1");
  })

  it('returns a maskify string if four characters', function() {
    expect(maskify("Skippy")).to.equal("##ippy");
    expect(maskify("4556364607935616")).to.equal("############5616");
  })
})
