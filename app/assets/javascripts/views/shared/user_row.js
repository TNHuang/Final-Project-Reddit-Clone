RedditClone.Views.UserRow = Backbone.View.extend({
  template: JST["shared/rows"],

  initialize: function (options) {
    this.user = options.user;
    this.listenTo(this.user, "sync change destroy", this.render);
  },

  events: {
    "click .do-something": "doSomeStuff",
  },

  render: function () {
    var content = this.template({user: this.user});
    this.$el.html(content);
    return this;
  },

  doSomeStuff: function (event) {
    event.preventDefault();
    event.preventPropagation();
    alert('do some stuff trigger');
  }

})
