class Agehama.Player extends Backbone.Model

  defaults:
    color: 'black'

  initialize: ->
    Backbone.Mediator.sub 'point:click', @move

  move: (x, y) =>
    color = @get 'color'
    Backbone.Mediator.pub 'user:move', x, y, color
    if color == 'black'
      @set color: 'white'
    else
      @set color: 'black'
