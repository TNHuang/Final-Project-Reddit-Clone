RedditClone.Views.UserShow = Backbone.View.extend({
  template: JST["users/new"],

  initialize: function (options) {
    this.user = options.user;
    this.listenTo(this.user, "sync change destroy", this.render);
  },

  events: {
    "click .delete-user": "deleteUser",
  },

  render: function () {
    var content = this.template({user: this.user});
    this.$el.html(content);
    return this;
  },

  deleteUser: function (event) {
    event.preventDefault();
    alert("user about to be delete!");
  }

})
