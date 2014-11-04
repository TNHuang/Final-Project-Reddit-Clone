RedditClone.Views.CommentRow = Backbone.View.extend({
  tagName: 'li',
  className: "nested-comments",
  template: JST['shared/commentrow'],
  initialize: function (options) {
    console.log("inside initializer")
    this.subViews = [];
    this.comment = options.comment;
    this.listenTo(this.comment, "sync change destroy remove", this.render);
    this.listenTo(this.comment, "add", this.addRender);
  },

  events: { "click button.delete-comment": "removeComment",
    "click .upvote-comment": "upvoteComment",
    "click .downvote-comment": "downvoteComment",
  },

  render: function () {
    console.log("inside render")
    var content = this.template({comment: this.comment});
    this.$el.html(content);
    console.log("after first render")
    var child_comments = this.comment.child_comments();
    console.log("after child comments")
    console.log(child_comments)
    if (child_comments.length > 0) {
      console.log("begin sub render")
      child_comments.forEach( this.addRender.bind(this) );
    }

    return this;
  },

  addRender: function (child_comment) {
    console.log("sub render")
    var view = new RedditClone.Views.CommentRow({ comment: child_comment})
    console.log("after sub view")
    this.subViews.push(view);
    this.$('ul').append(view.render().$el);
  },

  remove: function () {
    this.subViews.forEach(function (subView) {
      subView.remove();
    });
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
