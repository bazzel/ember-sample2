App.Router = Em.Router.extend
  enableLogging: true
  location: 'hash'
  root: Em.Route.extend
    # SETUP
    # EVENTS
    # STATES
    index: Em.Route.extend
      route: '/'
      redirectsTo: 'posts'

    posts: Em.Route.extend
      # SETUP
      route: '/posts'
      # EVENTS
      editPost: Em.State.transitionTo 'edit'
      showPost: Em.State.transitionTo 'show'
      goBack: Em.State.transitionTo 'index'
      # STATES
      index: Em.Route.extend
        # SETUP
        route: '/'
        connectOutlets: (router) ->
          router.get('applicationController').connectOutlet('posts', App.Post.find())
        # EVENTS
        # STATES
      show: Em.Route.extend
        # SETUP
        route: '/:post_id'
        connectOutlets: (router, post) ->
          router.get('applicationController').connectOutlet('post', post)
        # EVENTS
        # STATES
      edit: Em.Route.extend
        # SETUP
        route: '/:post_id/edit'
        connectOutlets: (router, post) ->
          router.get('applicationController').connectOutlet
            viewClass: App.EditPostView
            controller: router.get('postController')
            context: post
        # EVENTS
        # STATES
