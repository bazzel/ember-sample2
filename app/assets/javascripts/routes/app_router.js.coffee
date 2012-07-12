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
      createPost: Em.Route.transitionTo 'create'
      editPost: Em.Route.transitionTo 'edit'
      showPost: Em.Route.transitionTo 'show'
      goBack: Em.Route.transitionTo 'index'
      # STATES
      index: Em.Route.extend
        # SETUP
        route: '/'
        connectOutlets: (router) ->
          # TODO: Don't think this is the right way to rollback :(
          # (transaction = router.getPath('applicationController.transaction')) and transaction.rollback()

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
          router.getPath('applicationController.transaction').rollback()
          @_super(router, path)
        save: (router, event) ->
          router.getPath('applicationController.transaction').commit()
          router.transitionTo('index')
        cancel: (router, event) ->
          router.getPath('applicationController.transaction').rollback()
          router.transitionTo('index')


        # STATES
