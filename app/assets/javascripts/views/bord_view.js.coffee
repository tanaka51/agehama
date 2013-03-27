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
        point = @bord.getByPosition(x, y)
        $point = $("<div />").addClass(point.getClassName())
        $bordY.append($point)

      $(@el).append($bordY)
