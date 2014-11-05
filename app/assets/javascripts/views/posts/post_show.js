RedditClone.Views.PostShow = Backbone.View.extend({
  template: JST["posts/show"],
  className: "add-padding-left",
  initialize: function (options) {
    this.subViews = [];
    this.post = options.post;
    this.comments = this.post.comments();
    this.listenTo(this.post, "sync change", this.render);
  },

  events: {
    "click .upvote-post": "upvotePost",
    "click .downvote-post": "downvotePost",
  },

  render: function () {
    var content = this.template({post: this.post});
    this.$el.html(content);

    this.comments.forEach( this.addRender.bind(this) );
    return this;
  },

  addRender: function (comment) {
    var view = new RedditClone.Views.CommentRow(
      { comment: comment, comments: this.comments}
    );
    this.subViews.push(view);
    this.$('> ul').append(view.render().$el);
  },

  remove: function () {
    this.subViews.forEach(function (subView) {
      subView.remove();
    });
    Backbone.View.prototype.remove.call(this);
  },


  upvotePost: function (event) {
    event.preventDefault();
    this.post.upvote();
  },

  downvotePost: function (event) {
    event.preventDefault();
    this.post.downvote();
  },

})
