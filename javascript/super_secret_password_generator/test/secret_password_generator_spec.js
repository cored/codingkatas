var expect = require("chai").expect; 

var superSecretChars = [['a', '@'],['s', '$'],['o', '0'], ['h', '5'], ['x', '*']];
var createSSP = function(password) { 
  superSecretChars.forEach(function(sPair) { 
    var pattern = new RegExp(sPair[0], "gi");
     password = password.replace(pattern, sPair[1]);
   });
   return password;
}

describe("Make the password super secret based on a secret char set", function() { 
  it("return 5@*0rp@$$w0rd for haxorpassword", function() { 
    expect(createSSP("haxorpassword")).to.equal("5@*0rp@$$w0rd");
  });

  it("return 5@*0rp@$$w0rd for haxorpAssword", function() { 
    expect(createSSP("haxorpAssword")).to.equal("5@*0rp@$$w0rd");
  });
});
