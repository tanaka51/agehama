class Agehama.PointView extends Backbone.View
  tanName: 'div'
  className: 'point'

  initialize: ->
    _.bindAll @

    @model.bind "change:status", @changeStatus

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
    "click": ->
      Backbone.Mediator.pub 'point:click', @model.get("x"), @model.get("y")
    "mouseenter": ->
      Backbone.Mediator.pub 'point:mouseenter', @model.get("x"), @model.get("y")
    "mouseleave": ->
      Backbone.Mediator.pub 'point:mouseleave'

  changeStatus: ->
    if @model.isEmpty()
      $(@el).removeClass('black white')
    else
      $(@el).addClass @model.get "status"

  subscriptions:
    'point:mouseenter': 'highlight'

  highlight: (x, y) ->
      $(@el).removeClass "highlight-x highlight-y"
      $(@el).addClass "highlight-x" if x == @model.get("x")
      $(@el).addClass "highlight-y" if y == @model.get("y")
