App.Router = Em.Router.extend
  enableLogging: true
  location: 'hash'
  root: Em.Route.extend
    index: Em.Route.extend
      route: '/'
      redirectsTo: 'posts'

    posts: Em.Route.extend
      route: '/posts'
      index: Em.Route.extend
        route: '/'
        connectOutlets: (router) ->
          router.get('applicationController').connectOutlet('posts', App.Post.find())
