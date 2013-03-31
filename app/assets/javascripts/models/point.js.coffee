class Agehama.Point extends Backbone.Model

  defaults:
    x      : 0
    y      : 0
    status : ""     # "", 'black', 'white'
    top    : false
    bottom : false
    left   : false
    right  : false
    star   : false

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

  isEmpty: ->
    @get('status') == ""
