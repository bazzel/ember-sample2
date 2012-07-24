App.PostMixin = Em.Mixin.create
  deletePost: (view) ->
    id = view.context.get 'id'
    post = App.Post.find id
    if confirm("Are you sure you want to delete the post with title '#{post.get('title')}'?")
      post.deleteRecord()
      post.store.commit()
      App.router.transitionTo 'posts.index'

