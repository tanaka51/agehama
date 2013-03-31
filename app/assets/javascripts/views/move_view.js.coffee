class Agehama.MoveView extends Backbone.View
  tagName:'a'
  className: 'move btn btn-block'

  subscriptions:
    'player:startBlack': ->
      @color = '黒'
      $(@el).removeClass('btn-info')
      @render()
    'player:startWhite': ->
      @color = '白'
      $(@el).addClass('btn-info')
      @render()

  events:
    'click': ->
      Backbone.Mediator.pub 'move_view:click'

  initialize: ->
    @color = '黒'

  render: ->
    $(@el).text(@color)
    @
