class Agehama.PositionView extends Backbone.View
  tagName:'p'
  className: 'position'

  subscriptions:
    'point:mouseenter': 'render'
    'point:mouseleave': 'render'

  initialize: ->
    @text = "マウスホバーでポジション表示"

  render: (x, y)->
    if x? and y?
      $(@el).text "x: #{x}, y: #{y}"
    else
      $(@el).text @text
    @
