(function() {
  var Hello;

  Hello = (function() {
    function Hello(whom) {
      this.whom = whom;
    }

    Hello.prototype.greet = function() {
      return "Hello, " + this.whom + "!";
    };

    return Hello;

  })();

  this.Hello = Hello;

}).call(this);
