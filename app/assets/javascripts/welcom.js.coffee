# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  first = true
  originText = ''

  $("span.position").on "mouseenter", ->
    position = $("div.position p")
    if first
      originText = position.html()
      first = false

    # class likes "position x-0 y-1"
    classes = $(this).attr('class').split(' ')
    x = classes[1].split('-')[1]
    y = classes[2].split('-')[1]

    position.html("x:#{x} y:#{y}")

    $("span.position.x-#{x}, span.position.y-#{y}").map (i, p) ->
      position = $(p)
      klass = position.attr("class")
      if !klass.contains("black") and !klass.contains("white")
        position.addClass("highlight")

  $("span.position").on "mouseleave", ->
    $("div.position p").html(originText)

    $("span.position").removeClass("highlight")


  black = false
  $("span.position").on "click", ->
    position = $(this)
    black = !black
    color = ""
    if black
      color =  "black"
    else
      color =  "white"
    position.removeClass("highlight")
    position.addClass(color)
