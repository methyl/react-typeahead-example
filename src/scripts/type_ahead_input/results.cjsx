Result = require './result.cjsx'

module.exports = React.createClass
  render: ->
    <div style={@style().root} >
      {@renderItems()}
    </div>

  renderItems: ->
    @props.items.map (item, index) =>
      handleSelect = => @props.onSelect(item)

      <div style={@style().allButLastResult if index < @props.items.length - 1}>
        <Result name={item.name} description={item.description} onSelect={handleSelect} />
      </div>

  style: ->
    root:
      border: '1px solid #ccc'
      borderTop: 'none'
    allButLastResult:
      borderBottom: '1px dashed #ccc'
