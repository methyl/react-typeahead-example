Link = require('react-router').Link
RouteHandler = require('react-router').RouteHandler

module.exports = React.createClass
  displayName: 'HelloWorld'

  render: ->
    <div>
      <h2>Hello world!</h2>
      <RouteHandler/>
    </div>
