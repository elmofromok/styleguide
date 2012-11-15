# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

//= require jquery.scrollTo-min
//= require jquery.localscroll-min

jQuery(document).ready ->
  $(".sg-section-title").each (i) ->
    e = this
    $(e).closest("section").attr "id", $(this).text().replace(RegExp(" ", "g"), "")
    $("#sg-toc-list").append "<li><a class=\"\" href=\"#" + $(this).text().replace(RegExp(" ", "g"), "") + "\">" + $(e).text() + "</a></li>"
    $(e).append " <a class=\"back-to-top pointer up\" href=\"#sg-toc\"><span class=\"\">back to top</span></a>"

  $(".sg-toc-remove").hide()


  # Collapse the view code boxes
  $(".code-collapse").collapse().on("hidden", ->
    $(this).closest(".row").prev(".row").find(".show-code-toggle").removeClass("negative-action").addClass("positive-action").html "<i class=\"icon-white icon-eye-open\"></i> Show Code"
  ).on "shown", ->
    $(this).closest(".row").prev(".row").find(".show-code-toggle").removeClass("positive-action").addClass("negative-action").html "<i class=\"icon-white icon-eye-close\"></i> Hide Code"
 


  # fix sub nav on scroll. I stole this from the twitter bootstrap website. :)
  $win = $(window)
  $nav = $(".subnav")
  navTop = $nav.length and $nav.offset().top
  isFixed = 0

  $win.on "scroll", (event) ->
    processScroll()

  processScroll = ->
    i = undefined
    scrollTop = $win.scrollTop()
    if scrollTop >= navTop and not isFixed
      isFixed = 1
      $nav.addClass "subnav-fixed"
    else if scrollTop <= navTop and isFixed
      isFixed = 0
      $nav.removeClass "subnav-fixed"
  processScroll()

  $.localScroll offset: -80, lazy: true, hash: true # http://flesler.blogspot.com/2007/10/jquerylocalscroll-10.html

  true