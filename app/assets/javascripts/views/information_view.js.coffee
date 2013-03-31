class Agehama.InformationView extends Backbone.View
  el: "div.information"

  subscriptions:
    'nav_view:click:practice': 'renderPractice'
    'nav_view:click:game': 'renderGame'

  initialize: ->
    @render()

  render: (x, y)->
    nav_view = new Agehama.NavView
    $(@el).before nav_view.render().el

    @renderPractice()

  renderPractice: =>
    $(@el).html ""

    move_view = new Agehama.MoveView
    $(@el).append move_view.render().el

    clear_view = new Agehama.ClearView
    $(@el).append clear_view.render().el

    position_view = new Agehama.PositionView
    $(@el).append position_view.render().el

    notice_view = new Agehama.NoticeView
    $(@el).append notice_view.render().el

  renderGame: =>
    $(@el).html ""
