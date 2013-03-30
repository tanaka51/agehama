window.Agehama =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Agehama.BordView
    new Agehama.InformationView

$(document).ready ->
  Agehama.initialize()
