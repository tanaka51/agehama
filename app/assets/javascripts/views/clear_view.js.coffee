class Agehama.ClearView extends Backbone.View
  tagName:'a'
  className: 'move btn btn-block btn-danger'

  events:
    'click': ->
      Backbone.Mediator.pub 'clear_view:click'

  render: ->
    $(@el).text '全部消す'
    @
