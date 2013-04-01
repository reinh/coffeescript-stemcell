(function() {
  var Hello, ok;

  ok = function(val) {
    return expect(val).toBeTruthy();
  };

  Hello = this.Hello;

  describe('Hello', function() {
    return it('says hello', function() {
      return ok(new Hello('World').greet() === 'Hello, World!');
    });
  });

}).call(this);
