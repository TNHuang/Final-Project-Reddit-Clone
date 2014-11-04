RedditClone.Views.PostRow = Backbone.View.extend({
  tagName: 'tr',
  template: JST['shared/postrow'],
  initialize: function (options) {
    this.post = options.post;
    this.listenTo(this.post, "sync change destroy", this.render);
  },

  events: {
    "click button.delete-post": "removePost",
    "click .upvote-post": "upvotePost",
    "click .downvote-post": "downvotePost",
  },

  render: function () {
    console.log("rendering subview")
    var content = this.template({post: this.post});
    this.$el.html(content);
    return this;
  },


  remove: function () {
    Backbone.View.prototype.remove.call(this);
  },

  removePost: function (event) {
    event.preventDefault();
    this.post.destroy();
  },

  upvotePost: function (event) {
    this.post.upvote();
  },

  downvotePost: function (event) {
    this.post.downvote();
  },

})
