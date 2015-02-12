_ = require('underscore')

module.exports = React.createClass
  getInitialState: ->
    isHovered: false

  render: ->
    <div style={@styles().root} onClick={@props.onSelect} onMouseEnter={@handleMouseEnter} onMouseLeave={@handleMouseLeave}>
      <div style={@styles().name}>{@props.name}</div>
      <div style={@styles().description}>{@props.description}</div>
    </div>

  handleMouseEnter: ->
    @setState isHovered: true

  handleMouseLeave: ->
    @setState isHovered: false

  styles: ->
    styles =
      root:
        padding: '5px'
        fontFamily: 'Helvetica Neue'
        cursor: 'pointer'
        hovered:
          background: '#eee'
      name:
        fontWeight: 'bold'
      description:
        fontWeight: 300
        fontSize: "0.8em"

    if @state.isHovered
      _.extend styles.root, styles.root.hovered
    styles
