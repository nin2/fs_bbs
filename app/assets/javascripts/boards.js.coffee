# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
    $('#dialog-form').dialog 
        autoOpen: false
        height: 230
        width: 450
        modal: true
        buttons:
            "New Board": ->
               bValid = true
               #allFields.removeClass('ui-state-error')
               $('#create_board_submit').trigger('click')
            Cancel: ->
               $(this).dialog("close")

    $("#create-user")
        .button()
        .click ->
            $("#dialog-form").dialog("open")

