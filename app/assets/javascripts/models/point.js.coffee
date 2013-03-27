class Agehama.Point extends Backbone.Model

  defaults:
    x      : 0
    y      : 0
    status : ""     # black, white, eye, ...?
    top    : false
    bottom : false
    left   : false
    right  : false
    star   : false

  getClassName: ->
    x = @get "x"
    y = @get "y"
    "point x-#{x} y-#{y} #{@getStarName()} #{@getYName()} #{@getXName()}"

  getStarName: ->
    return "star" if @get "star"
    ""

  getYName: ->
    if @get "top"
      "top"
    else if @get "bottom"
      "bottom"
    else
      ""

  getXName: ->
    if @get "left"
      "left"
    else if @get "right"
      "right"
    else
      ""
