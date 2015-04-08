(function() {
  var generate;

  generate = require('../generate');

  module.exports = generate({
    path: '/api/items',
    template: {
      test: function() {
        return [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      }
    }
  });

}).call(this);

//# sourceMappingURL=items.js.map
