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

  $("span.position").on "mouseenter", ->
    me = $(this)

    # class likes "position x-0 y-1"
    classes = me.attr('class').split(' ')
    x = classes[1].split('-')[1]
    y = classes[2].split('-')[1]

    $("span.position.x-#{x}, span.position.y-#{y}").map (i, p) ->
      $(p).addClass("highlight")
    me.addClass("me")

    text = $("div.position p")
    saveTextAtFirst(text)
    text.html("x:#{x} y:#{y}")

  $("span.position").on "mouseleave", ->
    $("div.position p").html(originText)

    $("span.position").removeClass("highlight")
    $(this).removeClass("me")


  black = false
  $("span.position").on "click", ->
    position = $(this)
    black = !black
    color = ""
    if black
      color =  "black"
    else
      color =  "white"
    position.addClass(color)
