RedditClone.Views.PostRow = Backbone.View.extend({
  tagName: 'li',
  className: "comment-container row-container",
  template: JST['shared/postrow'],
  initialize: function (options) {
    this.sub = options.sub;
    this.post = options.post;
    this.listenTo(this.post, "sync change destroy", this.render);
  },

  events: {
    "click button.delete-post": "removePost",
    "click .upvote-post": "upvotePost",
    "click .downvote-post": "downvotePost",
    "click .change-img-url": "changeImgURL",
  },

  render: function () {
    var content = this.template({post: this.post, sub: this.sub});
    this.$el.html(content);
    return this;
  },


  remove: function () {
    Backbone.View.prototype.remove.call(this);
  },

  removePost: function (event) {
    event.preventDefault();
    var sub_id = $(event.currentTarget).data("sub-id");
    $.ajax({
      url: "api/posts/" + this.post.id,
      type: "DELETE",
      data: { sub_id: sub_id },
      dataType: 'json',
      success: function () {
        this.remove();
      }.bind(this)
    })

  },

  upvotePost: function (event) {
    this.post.upvote();
  },

  downvotePost: function (event) {
    this.post.downvote();
  },

  changeImgURL: function (event) {
    $.ajax({
      url: "api/posts/" + this.post.escape('id') + "/change_img_url",
      type: "POST",
      success: function (response) {
        this.post.set({ img_url: response.img_url })
      }.bind(this)
    })
  },

})
