class Agehama.Player extends Backbone.Model

  defaults:
    color: 'black'
    mode : 'practice' # 'practice', 'game'
    movable : false

  initialize: ->
    Backbone.Mediator.sub 'point:click', @move
    Backbone.Mediator.sub 'bord:successToMove', @nextPlayer
    Backbone.Mediator.sub 'move_view:click', @togglePlayer
    Backbone.Mediator.sub 'player:next_player', @startToMove

  move: (x, y) =>
    unless @get('movable')
      if @get('mode') is 'game'
        Backbone.Mediator.pub 'player:failureToMove', 'あなたの手番ではありません'
      return

    Backbone.Mediator.pub 'player:move', x, y, @get('color')

  nextPlayer: =>
    return if @get('mode') == 'practice'

    @set movable: false
    Backbone.Mediator.pub 'player:next_player', @get('color')

  togglePlayer: (color) =>
    myColor = @get('color')
    return if color isnt myColor

    @set movable: false
    Backbone.Mediator.pub 'player:next_player', myColor

  startToMove: (color) =>
    myColor = @get('color')
    return if myColor is color

    @set movable: true
    Backbone.Mediator.pub 'player:start', myColor
