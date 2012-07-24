App.DeletePostView = Em.View.extend
  templateName: 'posts/delete'
  tagName: 'span'
  deletePost: ->
    post = @get('post')
    if confirm("Are you sure you want to delete the post with title '#{post.get('title')}'?")
      post.deleteRecord()
      post.store.commit()
      App.router.transitionTo 'posts.index'
