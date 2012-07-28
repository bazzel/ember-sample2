App.Comment = DS.Model.extend
  body: DS.attr('string')
  post: DS.belongsTo('App.Post')
