class Agehama.MoveView extends Backbone.View
  tagName:'a'
  className: 'move btn btn-block'

  subscriptions:
    'player:start': 'renderWithColor'

  events:
    'click': ->
      Backbone.Mediator.pub 'move_view:click', @color

  initialize: ->
    @color = 'black'

  render: ->
    color = if @color is 'black'
      '黒'
    else
      '白'

    $(@el).text(color)
    @

  renderWithColor: (color) ->
    @color = if color is 'black'
      $(@el).removeClass('btn-info')
      color
    else
      $(@el).addClass('btn-info')
      color
    @render()
