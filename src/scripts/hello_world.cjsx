TypeAheadInput = require './type_ahead_input'

module.exports = React.createClass
  displayName: 'HelloWorld'

  getInitialState: ->
    filterValue: ''

  render: ->
    <div>
      <TypeAheadInput items={@filteredCities()} onChange={@handleChange} />
    </div>

  handleChange: (props) ->
    @setState filterValue: props.name

  filteredCities: ->
    @cities().filter (city) =>
      city.name.match RegExp(@state.filterValue, 'i')

  cities: ->
    [
      { name: 'Wrocław', description: 'Beautiful city' }
      { name: 'Warszawa', description: 'Ugly city' }
    ]
