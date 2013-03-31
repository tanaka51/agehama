class Agehama.Player extends Backbone.Model

  defaults:
    color: 'black'
    mode : 'practice' # 'practice', 'game'

  initialize: ->
    Backbone.Mediator.sub 'point:click', @move
    Backbone.Mediator.sub 'bord:successToMove', @nextPlayer
    Backbone.Mediator.sub 'move_view:click', @toggleColor

  move: (x, y) =>
    color = @get 'color'
    Backbone.Mediator.pub 'user:move', x, y, color

  nextPlayer: =>
    return if @get('mode') == 'practice'
    @toggleColor()

  toggleColor: =>
    if @get('color') == 'black'
      @set color: 'white'
      Backbone.Mediator.pub 'player:startWhite'
    else
      @set color: 'black'
      Backbone.Mediator.pub 'player:startBlack'
