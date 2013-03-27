class Agehama.PointView extends Backbone.View
  tanName: 'div'
  className: 'point'

  render: ->
    # maybe high cost...
    x = @model.get("x")
    y = @model.get("y")
    $(@el).addClass "x-#{x} y-#{y}"
    $(@el).addClass "star " if @model.get "star"
    $(@el).addClass @model.getYName()
    $(@el).addClass @model.getXName()
    @
