App.Router = Em.Router.extend
  enableLogging: true
  location: 'hash'
  root: Em.Route.extend
    index: Em.Route.extend
      route: '/'
      redirectsTo: 'posts'

    posts: Em.Route.extend
      route: '/posts'
      showPost: Em.State.transitionTo('show')
      index: Em.Route.extend
        route: '/'
        connectOutlets: (router) ->
          router.get('applicationController').connectOutlet('posts', App.Post.find())
      show: Em.Route.extend
        route: '/:post_id'
        connectOutlets: (router, post) ->
          router.get('applicationController').connectOutlet('post', post)
        goBack: Em.State.transitionTo('index')
