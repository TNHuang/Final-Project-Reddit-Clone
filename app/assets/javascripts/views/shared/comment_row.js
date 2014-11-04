RedditClone.Views.CommentRow = Backbone.View.extend({
  tagName: 'li',
  className: "nested-comments",
  template: JST['shared/commentrow'],
  initialize: function (options) {

    this.comment = options.comment;
    this.listenTo(this.comment, "sync change destroy", this.render);
  },

  events: { "click button.delete-comment": "removeComment",
    "click .upvote-comment": "upvoteComment",
    "click .downvote-comment": "downvoteComment",
  },

  render: function () {
    var content = this.template({comment: this.comment});
    this.$el.html(content);
    return this;
  },


  remove: function () {
    Backbone.View.prototype.remove.call(this);
  },

  removeComment: function (event) {
    event.preventDefault();
    var post_id = $(event.currentTarget).data("comment-id");
    $.ajax({
      url: "api/comments/" + this.comment.id,
      type: "DELETE",
      data: { post_id: post_id },
      dataType: 'json',
      success: function () {
        this.remove();
      }.bind(this)

    })

    // this.comment.destroy({ post_id: post_id });
  },

  upvoteComment: function (event) {
    this.comment.upvote();
  },

  downvoteComment: function (event) {
    this.comment.downvote();
  },

})
