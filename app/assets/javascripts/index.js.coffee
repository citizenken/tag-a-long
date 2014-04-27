# # Place all the behaviors and hooks related to the matching controller here.
# # All this logic will automatically be available in application.js.
# # You can use CoffeeScript in this file: http://coffeescript.org/
# $("#event_preview").css('visibility', 'hidden')
if gon
  nearbyEvents = gon.nearby_events 
  console.log(nearbyEvents)


  currentEventPreview = 0
  showPreview = ->
    if $("#event_preview").is(":visible")
      $("#event_preview").fadeTo "slow", 0, ->
        changePreview()
        return

    else
      changePreview()
    return

  changePreview = ->
    preview = $("#event_preview")
    currentEvent = nearbyEvents[currentEventPreview]
    if currentEvent[0].count_members
      count_members = currentEvent[0].count_members
    else
      count_members = 0
    $("#event_attendee_count").text count_members
    $("#event_title").text currentEvent[0].title
    $("#event_owner").text currentEvent[1].firstname
    preview.delay(1000).fadeTo "slow", 1
    preview.removeClass "invisible"  if preview.hasClass("invisible")
    if currentEventPreview + 1 < nearbyEvents.length
      currentEventPreview++
    else
      currentEventPreview = 0
    return

  window.setInterval (->
    showPreview()
    return
  ), 5000


# $(document).ready ->
#   registerForm = 0
#   showRegisterForm = ->
#     registerForm = 1    
#     checkEmailInUse()
#     $("#login_form").attr "action", "/users"
#     $(".form_field").attr "id", (_, id) ->
#       id.replace "session", "user"

#     $(".form_field").attr "name", (_, name) ->
#       name.replace "session", "user"

#     $(".user_form").prop "disabled", false
#     $(".user_form").fadeToggle()
#     $("#password_message").show()

#     $("#login_signup").val "Sign Up"
#     $("#reg_link").text "Click Here to Login"
#     return

#   hideRegisterForm = ->
#     registerForm = 0
#     $("#login_form").attr "action", "/sessions"
#     $(".form_field").attr "id", (_, id) ->
#       id.replace "user", "session"
#     $(".form_field").attr "name", (_, name) ->
#       name.replace "user", "session"
#     $(".user_form").prop "disabled", true
#     $(".user_form").fadeToggle()
#     $("#password_message").hide()
#     $("#login_signup").val "Login"
#     $("#reg_link").text "Click Here to Sign Up"
#     $("#email_container").removeClass "has-success has-feedback"
#     $("#email_container").removeClass "has-error has-feedback"
#     $(".validation_element").hide()
#     return

#   checkEmailInUse = ->
#     console.log('tset')
#     element = $("#email_field")
#     parent = element.parent()
#     if element.val() isnt ""
#       $.get(element.data("validate"),
#         email: element.val()
#       ).success(->
#         parent.removeClass "has-error has-feedback"
#         parent.addClass "has-success has-feedback"
#         parent.children(".glyphicon").removeClass "glyphicon-remove"
#         parent.children(".glyphicon").addClass "glyphicon-ok"
#         $("#email_glyphicon").show()
#         $('.form_bubble').hide()
#       ).error ->
#         parent.removeClass "has-success has-feedback"
#         parent.addClass "has-error has-feedback"
#         parent.children(".glyphicon").removeClass "glyphicon-ok"
#         parent.children(".glyphicon").addClass "glyphicon-remove"
#         $(".validation_element").show()
#     else
#       parent.removeClass "has-success has-feedback"
#       parent.removeClass "has-error has-feedback"
#       parent.children(".glyphicon").removeClass "glyphicon-remove"
#       parent.children(".glyphicon").removeClass "glyphicon-ok"
#       $(".validation_element").hide()


#   $("#login").on "click", ->
#     $("#login_box").slideToggle()

#   $("#reg_link").click ->
#     if registerForm is 0
#       showRegisterForm()
#     else
#       hideRegisterForm()

#   $(".user_form").hide().prop "disabled", true
  
#   $("#email_field").on "keyup", ->
#     checkEmailInUse()  if registerForm is 1
#     return