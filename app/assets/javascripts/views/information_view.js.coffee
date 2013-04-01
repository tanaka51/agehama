class Agehama.InformationView extends Backbone.View
  el: "div.information"

  initialize: ->
    @render()

  render: ->
    position_view = new Agehama.PositionView
    $(@el).append position_view.render().el

    notice_view = new Agehama.NoticeView
    $(@el).append notice_view.render().el
