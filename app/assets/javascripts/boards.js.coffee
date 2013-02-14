# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# $( "#dialog-form" ).dialog({
$ ->
    $('#dialog-form').dialog 
        autoOpen: false
        height: 300
        width: 350
        modal: true
        buttons:
            "New Board": ->
               bValid = true
               allFields.removeClass('ui-state-error')

            Cancel: ->
               $(this).dialog("close")
            Close: ->
               allFields.val("").removeClass("ui-state-color")

    $("#create-user")
        .button()
        .click ->
            $("dialog-form").dialog("open")
