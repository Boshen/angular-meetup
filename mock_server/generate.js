(function() {
  module.exports = function(obj) {
    return {
      path: obj.path,
      cache: false,
      template: obj.template,
      render: function(req, res) {
        return res.send(JSON.stringify(res.body, null, 2));
      },
      status: function(req, res) {
        if (obj.status) {
          return obj.status(req, res);
        }
      }
    };
  };

}).call(this);

//# sourceMappingURL=generate.js.map
