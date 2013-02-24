# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
    $('#login-form').dialog 
        autoOpen: false
        height: 270
        width: 450
        modal: false
        buttons:
            "Login": ->
               bValid = true
               #allFields.removeClass('ui-state-error')
               $('#login_submit_button').trigger('click')
            Cancel: ->
               $(this).dialog("close")

    $("#login-button")
        .button()
        .click ->
            $("#login-form").dialog("open")

$ ->
    $('#signup-form').dialog 
        autoOpen: false
        height: 370
        width: 470
        modal: false
        buttons:
            "Sign up": ->
               bValid = true
               #allFields.removeClass('ui-state-error')
               $('#signup_submit_button').trigger('click')
            Cancel: ->
               $(this).dialog("close")

    $("#signup-button")
        .button()
        .click ->
            $("#signup-form").dialog("open")

