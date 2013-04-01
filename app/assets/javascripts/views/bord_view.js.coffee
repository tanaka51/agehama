class Agehama.BordView extends Backbone.View
  el: "div.bord"

  initialize: ->
    @bord = new Agehama.Bord
    @size = @bord.size

    @render()

  render: ->
    for y in [0...@size]
      $bordY = $("<div />").addClass("bord-y y-#{y}")
      for x in [0...@size]
        point_view = new Agehama.PointView model: @bord.getByPosition(x, y)
        $bordY.append point_view.render().el

      $(@el).append($bordY)

  subscriptions:
    'player:move': 'move'

  move: (x, y, status) ->
    @bord.move x, y, status
