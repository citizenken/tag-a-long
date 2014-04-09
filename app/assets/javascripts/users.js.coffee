# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
    charCounter = ->
        len = $("#description").val().length
        $("#charCounter").val 140 - len
        return

    $("#description").on "keyup", charCounter
    
    $("#event_time").datetimepicker
      timeFormat: "hh:mm tt z"
      timezone: "ET"
      timezoneList: [
        {
          value: "ET"
          label: "Eastern"
        }
        {
          value: "CT"
          label: "Central"
        }
        {
          value: "MT"
          label: "Mountain"
        }
        {
          value: "PT"
          label: "Pacific"
        }
      ]
      
    $('#event_address').geocomplete();
    
    $("#new_event").click ->
      $('#new_event_form').slideToggle()
      
    $( "#user_events_accordion" ).accordion({
      active: false,
      collapsible: true});
