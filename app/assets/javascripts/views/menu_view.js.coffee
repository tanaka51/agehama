class Agehama.MenuView extends Backbone.View
  el: "div.menu"

  subscriptions:
    'nav_view:click:practice': 'renderPractice'
    'nav_view:click:game': 'renderGame'

  initialize: ->
    @practice_view = new Agehama.PracticeView
    @game_view = new Agehama.GameView
    @render()

  render: ->
    nav_view = new Agehama.NavView
    $(@el).append nav_view.render().el

    @renderPractice()

  renderPractice: =>
    @game_view.unrender()
    $(@el).append @practice_view.render().el

  renderGame: =>
    @practice_view.unrender()
    $(@el).append @game_view.render().el
