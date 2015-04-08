module.exports = (obj)->
  path: obj.path
  cache: false
  template: obj.template
  render: (req, res)->
    res.send(JSON.stringify(res.body, null, 2))
  status: (req, res)->
    if obj.status
      obj.status(req, res)
