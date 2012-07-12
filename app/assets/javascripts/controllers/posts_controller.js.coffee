App.PostsController = Ember.ArrayController.extend
  # ArrayController does'nt seem to have an isLoaded
  # property, though this may come in handy.
  # Nevertheless, we can define our own:
  isLoaded: (->
    @filterProperty('isLoaded', true).get('length')
  ).property('@each.isLoaded')
