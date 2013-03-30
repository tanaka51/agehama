class Agehama.PointView extends Backbone.View
  tanName: 'div'
  className: 'point'

  initialize: ->
    _.bindAll @

    @model.bind "change:status", @addStatus

  render: ->
    # maybe high cost...
    x = @model.get("x")
    y = @model.get("y")
    $(@el).addClass "x-#{x} y-#{y}"
    $(@el).addClass "star" if @model.get "star"
    $(@el).addClass @model.getYName()
    $(@el).addClass @model.getXName()
    @

  events: ->
    "click": "move"

  addStatus: ->
    $(@el).addClass @model.get "status"

  move: ->
    @model.set status: "black"
