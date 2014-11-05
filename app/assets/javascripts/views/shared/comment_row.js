RedditClone.Views.CommentRow = Backbone.View.extend({
  tagName: 'li',
  className: "nested-comments",
  template: JST['shared/commentrow'],
  initialize: function (options) {

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

    var content = this.template({comment: this.comment});
    this.$el.html(content);

    var child_comments = this.comment.child_comments();

    // var child_collection = new RedditClone.Collections.Comments();
    // if (child_comments.length !== 0) {
    // var child_models = child_comments.forEach( function(e){
    //   child_collection.add(new RedditClone.Models.Comment(e));
    // })

    if (child_collection.length > 0 ) {
      child_collection.forEach( this.addRender.bind(this) );
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
