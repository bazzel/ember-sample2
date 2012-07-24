App.PostRowView = Em.View.extend
  templateName: 'posts/row'
  tagName: 'tr'

App.PostRowView.reopen App.PostMixin
