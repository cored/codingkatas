var expect = require("chai").expect;

var isPrime = function(number) { 
  var res = true;
  for(var i = 2; i<number; i++) { 
    if (number % i === 0) 
      res = false;
  }
  return res;
}

var divisors = function(number) { 
  var sequences = Array.apply(null, {length: number}).map(Number.call, Number);
  if (isPrime(number)) 
    return number+" is prime";

  return sequences.reduce(function(divs, num) { 
      if ((number % num === 0) && (num !== number) && (num !== 1))
        divs.push(num);
      return divs; 
    },[]);
}

describe("Find the divisor", function() { 
  it("returns the divisors for 15", function() { 
    expect(divisors(15)).to.deep.equal([3, 5]);
  });

  it("returns the divisors for 12", function() { 
    expect(divisors(12)).to.deep.equal([2,3,4, 6]);
  });

  it("returns is prime for 13", function() { 
    expect(divisors(13)).to.equal("13 is prime");
  });
});
