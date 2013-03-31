class Agehama.InformationView extends Backbone.View
  el: "div.information"

  initialize: ->
    @render()

  render: (x, y)->
    move_view = new Agehama.MoveView
    $(@el).append move_view.render().el

    clear_view = new Agehama.ClearView
    $(@el).append clear_view.render().el

    position_view = new Agehama.PositionView
    $(@el).append position_view.render().el

    notice_view = new Agehama.NoticeView
    $(@el).append notice_view.render().el
