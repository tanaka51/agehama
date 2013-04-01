class Agehama.NoticeView extends Backbone.View
  tagName:'p'
  className: 'notice'

  subscriptions:
    'bord:successToMove': 'renderMoveMessage'
    'bord:failureToMove': 'renderMoveMessage'

  initialize: ->
    @render()

  render: (message) ->
    $(@el).text message || "　"
    @

  renderMoveMessage: (x, y, status, message) ->
    @render(message)
