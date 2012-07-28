App.Router = Em.Router.extend
  enableLogging: true
  location: 'hash'
  root: Em.Route.extend
    # SETUP
    # EVENTS
    # STATES
    index: Em.Route.extend
      route: '/'
      redirectsTo: 'posts.index'

    posts: Em.Route.extend
      # SETUP
      route: '/posts'
      # EVENTS
      createPost: Em.Route.transitionTo 'create'
      editPost: Em.Route.transitionTo 'edit'
      showPost: Em.Route.transitionTo 'show.index'
      goBack: Em.Route.transitionTo 'posts.index'
      cancel: (router, event) ->
        router.get('applicationController.transaction').rollback()
        router.transitionTo('index')
      save: (router, event) ->
        router.get('applicationController.transaction').commit()
        router.transitionTo('index')
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
        showComments: Em.Route.transitionTo('comments')
        showTrackbacks: Em.Route.transitionTo('trackbacks')
        # STATES
        index: Em.Route.extend
          route: '/'
          redirectsTo: 'comments'
        comments: Em.Route.extend
          route: '/comments'
          connectOutlets: (router) ->
            postController = router.get('postController')
            postController.connectOutlet('comments', postController.get('comments'))
        trackbacks: Em.Route.extend
          route: '/trackbacks'
          connectOutlets: (router) ->
            postController = router.get('postController')
            postController.connectOutlet('trackbacks', postController.get('trackbacks'))
      edit: Em.Route.extend
        # SETUP
        route: '/:post_id/edit'
        connectOutlets: (router, post) ->
          transaction = router.get('store').transaction()
          transaction.add post
          router.get('applicationController').set('transaction', transaction)
          router.get('applicationController').connectOutlet
            viewClass: App.EditPostView
            controller: router.get('postController')
            context: post
        # EVENTS
        unroutePath: (router, path) ->
          router.get('applicationController.transaction').rollback()
          @_super(router, path)
        # STATES
      create: Em.Route.extend
        # SETUP
        route: '/new'
        connectOutlets: (router) ->
          transaction = router.get('store').transaction()
          post = transaction.createRecord(App.Post)

          router.get('applicationController').set('transaction', transaction)
          router.get('applicationController').connectOutlet
            viewClass: App.NewPostView
            controller: router.get('postController')
            context: post
        # EVENTS
        unroutePath: (router, path) ->
          router.get('applicationController.transaction').rollback()
          @_super(router, path)
        # STATES
