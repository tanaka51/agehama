window.Agehama =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Agehama.BordView
    new Agehama.InformationView
    new Agehama.MenuView
    @black = new Agehama.Player color: 'black', movable: true
    @white = new Agehama.Player color: 'white'

$(document).ready ->
  Agehama.initialize()
