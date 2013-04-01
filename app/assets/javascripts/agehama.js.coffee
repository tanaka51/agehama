window.Agehama =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Agehama.BordView
    new Agehama.InformationView
    new Agehama.MenuView
    new Agehama.Player

$(document).ready ->
  Agehama.initialize()
