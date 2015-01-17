var expect = require("chai").expect 

var sumStrings = function(a, b) { 
  if (a.length < 20 && b.length < 20)
    return (parseInt(a) + parseInt(b)).toString();

  var zeroes = new Array(a.length > b.length ? a.length + 1 : b.length +1).join('0');

  if (a.length > b.length)  
    b = String(zeroes + b).slice(-a.length);
  else 
    a = String(zeroes + a).slice(-b.length);

  var reduced = a.split("").reduce(function(sum, curr, idx, reduced) { 
    sum.push(parseInt(curr, 10) + parseInt(b.charAt(idx), 10))
    return sum;
  }, []);

  console.log(reduced);
  for (var idx = reduced.length-1; idx >= 0; idx--) { 
    reduced[idx-1] += Math.floor(reduced[idx] / 10); 
    if (idx !== 0) 
      reduced[idx] = reduced[idx] % 10;

    console.log(idx);
    console.log(reduced[idx-1]);
  }

  return reduced.join('');
}

describe("Sum strings as numbers", function() { 
    it("returns the sum for just one index numbers", function() { 
      expect(sumStrings('0','0')).to.equal('0');
      expect(sumStrings('1','1')).to.equal('2');
      });

      it("returns the sum of two index numbers", function() { 
      expect(sumStrings('10', '20')).to.equal('30');
      expect(sumStrings('01', '02')).to.equal('3');
      expect(sumStrings('10', '1')).to.equal('11');
      expect(sumStrings('1', '10')).to.equal('11');
      });

  it("returns the sum of three index numbers", function() { 
    expect(sumStrings('123', '456')).to.equal('579');
    expect(sumStrings('101', '1')).to.equal('102');
    expect(sumStrings('999', '1')).to.equal('1000');
    expect(sumStrings('999', '999')).to.equal('1998');
  }); 


  it("handling different size of numbers", function() {
    expect(sumStrings('8797', '45')).to.equal('8842');
    expect(sumStrings('10000000000000000', '1')).to.equal('10000000000000001');
  });

  it("handles big numbers", function() { 
    expect(sumStrings('712569312664357328695151392', '8100824045303269669937')).to.equal('712577413488402631964821329');
  }); 
});
