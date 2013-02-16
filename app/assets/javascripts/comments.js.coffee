# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
    $('#dialog-form').dialog 
        autoOpen: false
        height: 480
        width: 600
        modal: true
        buttons:
            "Post Comment": ->
               bValid = true
               #allFields.removeClass('ui-state-error')
               $('#post_comment_submit').trigger('click')
            Cancel: ->
               $(this).dialog("close")

    $("#post-comment")
        .button()
        .click ->
            $("#dialog-form").dialog("open")

