Results = require './type_ahead_input/results'

module.exports = React.createClass
  propTypes: {
    items: React.PropTypes.array.isRequired
  }

  getInitialState: ->
    value: ''
    selectedValue: ''

  render: ->
    <div>
      <input value={@state.value} onChange={@handleChange} style={@style().input} />
      <div style={@style().results}>
        { <Results items={@filteredItems()} onSelect={@handleSelect} /> if @shouldRenderResults() }
      </div>
    </div>

  shouldRenderResults: ->
    @state.value.length > 0 && @state.value != @state.selectedValue

  handleSelect: (item) ->
    @setState value: item.name, selectedValue: item.name

  handleChange: (e) ->
    @setState value: e.target.value

  filteredItems: ->
    valueMatcher = RegExp "^#{@state.value}", "i"

    @props.items.filter (item) ->
      item.name.match(valueMatcher) ||
        item.description.match(valueMatcher)

  style: ->
    input:
      marginBottom: 0
    results:
      marginBottom: '1.2rem'
