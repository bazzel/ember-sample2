App.Trackback = DS.Model.extend
  url: DS.attr('string')
  post: DS.belongsTo('App.Post')
