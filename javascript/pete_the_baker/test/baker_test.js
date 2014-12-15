var expect = require("chai").expect; 

var cakes = function(recipe, ingredients) { 
  var result = Math.floor(Object.keys(recipe).map(function(ingredient) { 
    return ingredients[ingredient] / recipe[ingredient];
  }).sort(function(a,b) {
    return a - b;
  })[0]);

  return isNaN(result) ? 0 : result;
}

describe("Pete the baker", function() { 
  it("calculates the recipes for empty ingredients", function() { 
    recipe = {}; 
    available = {}; 
    expect(cakes(recipe, available)).to.equal(0);
  });

  it("calculates the recipes for one ingredient", function() { 
    recipe = {flour: 100};
    available = {flour: 100}; 
    expect(cakes(recipe, available)).to.equal(1);
  });

  it("calculates the recipes for two ingredient", function() { 
    recipe = {flour: 500, sugar: 200};
    available = {flour: 1200, sugar: 1200};
    expect(cakes(recipe, available)).to.equal(2);
  });

  it("calculates the recipes for more than two ingredient", function() { 
    recipe = {flour: 500, sugar: 200, eggs: 1};
    available = {flour: 1200, sugar: 1200, eggs: 5, milk: 200};
    expect(cakes(recipe, available)).to.equal(2);
  });


  it("calculates the amount for another recipe", function() { 
    recipe = {apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100};
    available = {sugar: 500, flour: 2000, milk: 2000};
    expect(cakes(recipe, available)).to.equal(0);
  });
})
