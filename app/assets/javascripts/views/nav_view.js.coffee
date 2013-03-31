class Agehama.NavView extends Backbone.View
  tagName:'ul'
  className: 'nav nav-tabs'

  events:
    'click #practice': ->
      @practice.addClass 'active'
      @game.removeClass 'active'
      Backbone.Mediator.pub 'nav_view:click:practice'
    'click #game': ->
      @practice.removeClass 'active'
      @game.addClass 'active'
      Backbone.Mediator.pub 'nav_view:click:game'

  initialize: ->
    @practice = $('<li id="practice">').addClass('active').append($('<a>').text('練習モード'))
    @game = $('<li id="game">').append($('<a>').text('本番モード'))

  render: ->
    $(@el).append(@practice).append(@game)
    @
