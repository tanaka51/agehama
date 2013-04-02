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
    @at @calcIndex x, y

  calcIndex: (x, y) ->
    return null unless 0 <= x < @size
    return null unless 0 <= y < @size
    @size * y + x

  move: (x, y, status) ->
    point = @getByPosition x, y
    if !point.isEmpty()
      Backbone.Mediator.pub 'bord:failureToMove', x, y, status, "既に置かれています"
    else if @isEye point, status
      Backbone.Mediator.pub 'bord:failureToMove', x, y, status, "着手禁止点です"
    else
      point.set status: status
      Backbone.Mediator.pub 'bord:successToMove', x, y, status

  isEye: (point, status) ->
    # 仮に置いてみる
    prev_status = point.get 'status'
    point.set {status: status}, {silent: true}

    isEye = @isRemovalStone(point.get('x'), point.get('y'), status)

    # 戻す
    point.set {status: prev_status}, {silent: true}
    isEye

  allClear: =>
    @each (point) ->
      point.set status: ""

  isRemovalStone: (x, y, status) =>
    checkedPoints = []

    recursive = (x, y, status) =>
      checkedPointIndex = @calcIndex x, y
      return true if checkedPoints[checkedPointIndex]
      checkedPoints[checkedPointIndex] = true

      point = @getByPosition x, y
      return false if point.isEmpty()

      if point.get('status') == status
        if x > 1
          return false unless recursive(x - 1, y, status)
        if x < (@size - 1)
          return false unless recursive(x + 1, y, status)
        if y > 1
          return false unless recursive(x, y - 1, status)
        if y < (@size - 1)
          return false unless recursive(x, y + 1, status)

      return true

    _.bind recursive
    recursive x, y, status
