App.PostFormView = Em.View.extend
  templateName: 'posts/form'
  didInsertElement: ->
    @$(':text:visible:enabled:first').focus()
