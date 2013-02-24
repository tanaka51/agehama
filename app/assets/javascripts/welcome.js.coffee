# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  first = true
  originText = ''

  saveTextAtFirst = (text) ->
    if first
      originText = text.html()
      first = false

  addHighlightX = (item) ->
    $(item).addClass("highlight-x")

  addHighlightY = (item) ->
    $(item).addClass("highlight-y")

  removeHighlight = (item) ->
    $(item).removeClass("highlight-x")
    $(item).removeClass("highlight-y")

  $("div.bord").delegate "div.bord-xy", "mouseenter", ->
    # class likes "position x-0 y-1"
    classes = $(this).attr('class').split(' ')
    x = classes[1].split('-')[1]
    y = classes[2].split('-')[1]

    removeHighlight(item) for item in $("div.bord-xy")

    addHighlightX(item) for item in $("div.bord-xy.x-#{x}")
    addHighlightY(item) for item in $("div.bord-xy.y-#{y}")

    text = $("div.position p")
    saveTextAtFirst(text)
    text.html("x:#{x} y:#{y}")

  $("div.bord").delegate "div.bord-xy", "mouseleave", ->
    $("div.position p").html(originText)

  black = false
  $("div.bord").delegate "div.bord-xy", "click", ->
    position = $(this)
    black = !black
    color = ""
    if black
      color =  "black"
    else
      color =  "white"
    position.addClass(color)
