class Agehama.MenuView extends Backbone.View
  el: "div.menu"

  subscriptions:
    'nav_view:click:practice': 'renderPractice'
    'nav_view:click:game': 'renderGame'

  initialize: ->
    @render()

  render: ->
    nav_view = new Agehama.NavView
    $(@el).append nav_view.render().el

    @renderPractice()

  renderPractice: =>
    move_view = new Agehama.MoveView
    $(@el).append move_view.render().el

    clear_view = new Agehama.ClearView
    $(@el).append clear_view.render().el

  renderGame: =>
