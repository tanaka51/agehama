class Agehama.PracticeView extends Backbone.View
  tanName: 'div'
  className: 'practice'

  initialize: ->
    @move_view = new Agehama.MoveView
    @clear_view = new Agehama.ClearView
    @render()

  render: ->
    $(@el).append @move_view.render().el
    $(@el).append @clear_view.render().el
    @

  unrender: ->
    $(@el).remove()
