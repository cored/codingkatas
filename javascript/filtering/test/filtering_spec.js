var expect = require("chai").expect

var roomMates = function(rooms, floor) {
  return rooms.filter(function(room) {
    return (Math.floor(rooms.indexOf(room) / 6)+1) === floor && room.length > 0;
  });
}

describe("Filtering roomates", function() {
  it("from the first floor", function() {
    var a = [ "foo", "bar", "foobar", "barfoo", "foofoo", "barbar" ];
    expect(roomMates(a, 1)).to.deep.equal(a);
  });

  it("from the first floor", function() {
    var a = [ "foo", "bar", "foobar", "barfoo", "foofoo", "barbar" ];
    expect(roomMates(a, 2)).to.deep.equal([]);
  });

  it("handling empty rooms", function() { 
    var a = ["foo","bar","","barfoo","","barbar","ying","","yingyang","","yangyang","yingying"];
    expect(roomMates(a, 1)).to.deep.equal(["foo","bar","barfoo","barbar"]);
  })
  
});
