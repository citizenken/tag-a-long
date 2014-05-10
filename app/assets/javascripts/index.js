// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
// $("#event_preview").css('visibility', 'hidden')
var changePreview, currentEventPreview, nearbyEvents, showPreview;

if (gon) {
  nearbyEvents = gon.nearby_events;
  console.log(nearbyEvents);
  currentEventPreview = 0;
  showPreview = function() {
    if ($("#event_preview").is(":visible")) {
      $("#event_preview").fadeTo("slow", 0, function() {
        changePreview();
      });
    } else {
      changePreview();
    }
  };
  changePreview = function() {
    var count_members, currentEvent, preview;
    preview = $("#event_preview");
    currentEvent = nearbyEvents[currentEventPreview];
    if (currentEvent[0].count_members) {
      count_members = currentEvent[0].count_members;
    } else {
      count_members = 0;
    }
    $("#event_attendee_count").text(count_members);
    $("#event_title").text(currentEvent[0].title);
    $("#event_owner").text(currentEvent[1].firstname);
    preview.delay(1000).fadeTo("slow", 1);
    if (preview.hasClass("invisible")) {
      preview.removeClass("invisible");
    }
    if (currentEventPreview + 1 < nearbyEvents.length) {
      currentEventPreview++;
    } else {
      currentEventPreview = 0;
    }
  };
  window.setInterval((function() {
    showPreview();
  }), 5000);
}

$(document).ready(function() {
  var checkEmailInUse, hideRegisterForm, registerForm, showRegisterForm, signinForm, signup, signupButton;
  registerForm = 0;
  signinForm = 0;
  signup = $("#signup");
  signupButton = $("#signup-button");
  showRegisterForm = function() {
    registerForm = 1;
    signup.hide().removeClass("hidden");
    signup.slideToggle();
    $("#signup_email_field").focus();
    signupButton.text("Sign up!");
    signupButton.prop('type', 'submit');
  };
  hideRegisterForm = function() {
    var emailContainer;
    registerForm = 0;
    signup.slideToggle();
    signupButton.text("Sign up to check them out!");
    emailContainer = $("#email_container");
    emailContainer.removeClass("has-success has-feedback");
    emailContainer.removeClass("has-error has-feedback");
    $(".validation_element").hide();
  };
  checkEmailInUse = function() {
    var element, glyphicon, parent;
    element = $("#signup_email_field");
    parent = element.parent();
    glyphicon = parent.children(".glyphicon");
    if (element.val() !== "") {
      return $.get(element.data("validate"), {
        email: element.val()
      }).success(function() {
        parent.removeClass("has-error has-feedback");
        parent.addClass("has-success has-feedback");
        glyphicon.removeClass("glyphicon-remove");
        glyphicon.addClass("glyphicon-ok");
        $("#email_glyphicon").show();
        return $('.form_bubble').hide();
      }).error(function() {
        parent.removeClass("has-success has-feedback");
        parent.addClass("has-error has-feedback");
        glyphicon.removeClass("glyphicon-ok");
        glyphicon.addClass("glyphicon-remove");
        return $(".validation_element").show();
      });
    } else {
      parent.removeClass("has-success has-feedback");
      parent.removeClass("has-error has-feedback");
      glyphicon.removeClass("glyphicon-remove");
      glyphicon.removeClass("glyphicon-ok");
      return $(".validation_element").hide();
    }
  };
  $("#toggle-signup-form").click(function() {
    if (registerForm === 0) {
      $("#toggle-signup-form").text("Cancel");
      return showRegisterForm();
    } else {
      $("#toggle-signup-form").text("Sign up to check them out!");
      return hideRegisterForm();
    }
  });
  $("#signup_email_field").on("keyup", function() {
    checkEmailInUse();
  });
  return $("#toggle-signin-form").click(function() {
    if (signinForm === 0) {
      signinForm = 1;
      $(".signin_form").hide().removeClass("invisible").show("slide", {
        direction: "right"
      }, 1000);
      return $("#toggle-signin-form").text("Cancel");
    } else {
      signinForm = 0;
      $(".signin_form").show("slide", {
        direction: "left"
      }, 1000).hide().addClass("invisible");
      return $("#toggle-signin-form").text("Sign in");
    }
  });
});
