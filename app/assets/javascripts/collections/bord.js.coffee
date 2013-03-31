class Agehama.Bord extends Backbone.Collection

  model: Agehama.Point
  size : 19

  initialize: ->
    for y in [0...@size]
      top = y == 0
      bottom = y == (@size - 1)
      for x in [0...@size]
        left  = x == 0
        right = x == (@size - 1)
        star  = (x == 3 or x == 9 or x == 15) and (y == 3 or y == 9 or y == 15)

        @add(new @model x: x, y: y, top: top, bottom: bottom, left: left, right: right, star: star)

  getByPosition: (x, y) ->
    @at(@size * y + x)

  move: (x, y, status) ->
    point = @getByPosition x, y
    if point.get('status') == ""
      point.set status: status
      Backbone.Mediator.pub 'bord:successToMove', x, y, status
    else
      Backbone.Mediator.pub 'bord:failureToMove', x, y, status, "既に置かれています"
