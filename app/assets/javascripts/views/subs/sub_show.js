RedditClone.Views.SubShow = Backbone.View.extend({
  template: JST["subs/show"],
  className: "add-padding-left",

  initialize: function (options) {
    this.subViews = [];

    this.sub = options.sub;
    this.posts = this.sub.posts();

    this.listenTo(this.sub, "sync remove", this.render);
    this.listenTo(this.sub, "add", this.addRender);
  },

  render: function () {

    var content = this.template({sub: this.sub});
    this.$el.html(content);
    this.posts.forEach( this.addRender.bind(this));

    return this;
  },

  addRender: function (post) {
    var view = new RedditClone.Views.PostRow({ post: post})
    this.subViews.push(view);
    this.$('table').append(view.render().$el);
  },

  remove: function () {
    this.subViews.forEach(function (subView) {
      subView.remove();
    });
    Backbone.View.prototype.remove.call(this);
  }

});
