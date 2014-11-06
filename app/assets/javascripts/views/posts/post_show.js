RedditClone.Views.PostShow = Backbone.View.extend({
  template: JST["posts/show"],
  className: "add-padding-left",
  initialize: function (options) {
    this.subViews = [];
    this.post = options.post;
    this.comments = this.post.comments();
    this.listenTo(this.post, "sync change", this.render);
    this.listenTo(this.comments, "add", this.addRender);
  },

  events: {
    "click .upvote-post": "upvotePost",
    "click .downvote-post": "downvotePost",
    "submit .reply-post-form": "replyPost",
  },

  render: function () {

    var content = this.template({post: this.post});
    this.$el.html(content);

    this.comments.forEach( this.addRender.bind(this) );
    return this;
  },

  addRender: function (comment) {
    console.log("sub-rendering")
    var view = new RedditClone.Views.CommentRow(
      { comment: comment}
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

  replyPost: function (event) {
    event.preventDefault();

    var params = $(event.currentTarget).serializeJSON();

    var newComment = new RedditClone.Models.Comment(params["comment"]);
    $.ajax({
      url: "api/posts/" + this.post.id + "/comments",
      type: "POST",
      data: params ,
      dataType: 'json',
      success: function (response) {
        newComment.set({
          votes: response.votes,
          author_id: response.author_id,
          author_name: response.author_name,
          parent_comment_id: response.parent_comment_id
          });
        this.comments.add(newComment);
        $('body, html').scrollTop(5000);
        Backbone.history.navigate("posts/" + this.post.id, {trigger: true});
      }.bind(this)
    })

  },

  upvotePost: function (event) {
    event.stopPropagation();
    this.post.upvote();
  },

  downvotePost: function (event) {
    event.stopPropagation();
    this.post.downvote();
  },

})
