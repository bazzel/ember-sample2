App.Post = DS.Model.extend
  title: DS.attr('string')
  body: DS.attr('string')
  intro: (->
    length = 80
    body = @get('body')

    if body.length > length
      body.substring(0, length) + '...'
    else
      body
  ).property('body')

  published: DS.attr('boolean')
