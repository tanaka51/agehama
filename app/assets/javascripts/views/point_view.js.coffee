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
    "mouseenter": ->
      Backbone.Mediator.pub 'point:mouseenter', @model.get("x"), @model.get("y")
    "mouseleave": ->
      Backbone.Mediator.pub 'point:mouseleave'

  addStatus: ->
    $(@el).addClass @model.get "status"

  move: ->
    @model.set status: "black"

  subscriptions:
    'point:mouseenter': 'highlight'

  highlight: (x, y) ->
      $(@el).removeClass "highlight-x highlight-y"
      $(@el).addClass "highlight-x" if x == @model.get("x")
      $(@el).addClass "highlight-y" if y == @model.get("y")
