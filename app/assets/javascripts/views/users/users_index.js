RedditClone.Views.UserIndex = Backbone.View.extend({
  template: JST["users/index"],

  initialize: function (options) {
    this.subViews = [];
    this.users = options.users;
    this.listenTo(this.users, "add", this.addRender);
  },

  events: function () {

  },

  render: function () {
    var content = this.template();
    this.$el.html(content);

    return this;
  },

  addRender: function (options) {
    var content = new RedditClone.Views.UserShow({user: options.user});
    this.subViews.push(content);
    this.$("ol.users").append(content);
  },

  remove: function () {
    this.subViews.forEach(function (subView) {
      subView.remove();
    })
    Backbone.View.prototype.remove.call(this);
  }
})
