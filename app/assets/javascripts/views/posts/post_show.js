RedditClone.Views.PostShow = Backbone.View.extend({
  template: JST["posts/show"],
  className: "body-wrapper",
  initialize: function (options) {
    this.subViews = [];
    this.post = options.post;
    this.comments = this.post.comments();
    this.listenTo(this.post, "sync", this.render);
    // this.listenTo(this.post, "add", this.addRender);
  },

  render: function () {
    var content = this.template({post: this.post});
    this.$el.html(content);
    var comments = this.post.comments();
    comments.forEach( this.addRender.bind(this) );

    return this;
  },

  addRender: function (comment) {
    var view = new RedditClone.Views.CommentRow({ comment: comment})
    this.subViews.push(view);
    this.$('> ul').append(view.render().$el);
  },

  remove: function () {
    this.subViews.forEach(function (subView) {
      subView.remove();
    });
    Backbone.View.prototype.remove.call(this);
  }

})
