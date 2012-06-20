# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ($) ->
  $('.store').addClass 'foo'
  $('.store:nth-child(4n+4)').addClass 'omega'
  $('.store:nth-child(4n+1)').addClass 'alpha'