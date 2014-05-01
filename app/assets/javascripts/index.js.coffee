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


$(document).ready ->
  registerForm = 0
  signinForm = 0
  
  signup = $("#signup")
  signupButton = $("#signup-button")
  showRegisterForm = ->
    registerForm = 1    
    # checkEmailInUse()
    # $("#toggle-signup-form").addClass("hidden")
    signup.hide().removeClass("hidden")
    signup.slideToggle()
    $("#signup_email_field").focus()
    # $("#password_message").show()
    signupButton.text "Sign up!"
    signupButton.prop 'type', 'submit'
    return

  hideRegisterForm = ->
    registerForm = 0
    signup.slideToggle()
    signupButton.text "Sign up to check them out!"
    emailContainer = $("#email_container")
    emailContainer.removeClass "has-success has-feedback"
    emailContainer.removeClass "has-error has-feedback"
    $(".validation_element").hide()
    return

  checkEmailInUse = ->
    element = $("#signup_email_field")
    parent = element.parent()
    glyphicon = parent.children(".glyphicon")
    if element.val() isnt ""
      $.get(element.data("validate"),
        email: element.val()
      ).success(->
        parent.removeClass "has-error has-feedback"
        parent.addClass "has-success has-feedback"
        glyphicon.removeClass "glyphicon-remove"
        glyphicon.addClass "glyphicon-ok"
        $("#email_glyphicon").show()
        $('.form_bubble').hide()
      ).error ->
        parent.removeClass "has-success has-feedback"
        parent.addClass "has-error has-feedback"
        glyphicon.removeClass "glyphicon-ok"
        glyphicon.addClass "glyphicon-remove"
        $(".validation_element").show()
    else
      parent.removeClass "has-success has-feedback"
      parent.removeClass "has-error has-feedback"
      glyphicon.removeClass "glyphicon-remove"
      glyphicon.removeClass "glyphicon-ok"
      $(".validation_element").hide()


  # $("#login").on "click", ->
  #   $("#login_box").slideToggle()

  $("#toggle-signup-form").click ->
    if registerForm is 0
      $("#toggle-signup-form").text "Cancel"
      showRegisterForm()
    else
      $("#toggle-signup-form").text "Sign up to check them out!"
      hideRegisterForm()

  # $(".user_form").hide().prop "disabled", true

  $("#signup_email_field").on "keyup", ->
    checkEmailInUse()
      # if registerForm is 1
    return

  $("#toggle-signin-form").click ->
    if signinForm is 0
      signinForm = 1
      $(".signin_form").hide().removeClass("invisible").show("slide", { direction: "right" }, 1000);
      $("#toggle-signin-form").text "Cancel"
    else
      signinForm = 0
      $(".signin_form").show("slide", { direction: "left" }, 1000).hide().addClass("invisible")
      $("#toggle-signin-form").text "Sign in"




  #$(".alert").hide().slideToggle().delay(2000).slideToggle() if ($(".alert").length)