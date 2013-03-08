class Agehama.BordView extends Backbone.View
  el: "div.bord"
  size: 19

  initialize: ->
    @render()

  render: ->
    for y in [0...@size]
      $bordY = $("<div />").addClass("bord-y y-#{y}")
      positionY = @getPositionY(y)

      for x in [0...@size]
        positionX = @getPositionX(x)
        star = @getStar(x, y)
        $bordXY = $("<div />").addClass("bord-xy x-#{x} y-#{y} #{star} #{positionY} #{positionX}")
        $bordY.append($bordXY)

      $(@el).append($bordY)

  getPositionY: (y) ->
    if y == 0
      "top"
    else if y == (@size - 1)
      "bottom"
    else
      ""

  getPositionX: (x) ->
    if x == 0
      "left"
    else if x == (@size - 1)
      "right"
    else
      ""

  getStar: (x, y) ->
    if (x == 3 or x == 9 or x == 15) and (y == 3 or y == 9 or y == 15)
      "star"
    else
      ""