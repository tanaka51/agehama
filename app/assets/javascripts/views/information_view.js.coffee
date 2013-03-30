class Agehama.InformationView extends Backbone.View
  el: "div.information"

  initialize: ->
    @render()

  render: (x, y)->
    position_view = new Agehama.PositionView
    $(@el).append position_view.render().el
