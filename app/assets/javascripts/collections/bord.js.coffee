class Agehama.Bord extends Backbone.Collection

  model: Agehama.Point
  size : 19

  initialize: ->
    Backbone.Mediator.sub 'clear_view:click', @allClear

    for y in [0...@size]
      top = y == 0
      bottom = y == (@size - 1)
      for x in [0...@size]
        left  = x == 0
        right = x == (@size - 1)
        star  = (x == 3 or x == 9 or x == 15) and (y == 3 or y == 9 or y == 15)

        @add(new @model x: x, y: y, top: top, bottom: bottom, left: left, right: right, star: star)

  getByPosition: (x, y) ->
    return null unless 0 <= x < @size
    return null unless 0 <= y < @size
    @at(@size * y + x)

  move: (x, y, status) ->
    point = @getByPosition x, y
    if !point.isEmpty()
      Backbone.Mediator.pub 'bord:failureToMove', x, y, status, "既に置かれています"
    else if @isEye x, y, status
      Backbone.Mediator.pub 'bord:failureToMove', x, y, status, "着手禁止点です"
    else
      point.set status: status
      Backbone.Mediator.pub 'bord:successToMove', x, y, status

  isEye: (x, y, status) ->
    top    = @getByPosition x, y - 1
    bottom = @getByPosition x, y + 1
    left   = @getByPosition x - 1, y
    right  = @getByPosition x + 1, y
    enemy = ''
    if status == 'black'
      enemy = 'white'
    else if status == 'white'
      enemy = 'black'

    _([top, bottom, left, right]).chain().compact().all((point) ->
      enemy == point.get 'status'
    ).value()

  allClear: =>
    @each (point) ->
      point.set status: ""
