class Agehama.GameView extends Backbone.View
  tanName: 'div'
  className: 'game'

  initialize: ->
    @render()

  render: ->
    $(@el).text '本番モード(未実装)'
    @

  unrender: ->
    $(@el).remove()
