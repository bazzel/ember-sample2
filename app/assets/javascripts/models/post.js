VerySimpleCrud.Post = DS.Model.extend({
  title: DS.attr(''),
  body: DS.attr('string'),
  published: DS.attr('boolean')
});