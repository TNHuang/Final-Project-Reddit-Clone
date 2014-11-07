RedditClone.Views.CommentRow = Backbone.View.extend({
  tagName: 'li',
  className: "comment-container row-container",
  template: JST['shared/commentrow'],
  initialize: function (options) {

    this.subViews = [];
    this.comment = options.comment;

    this.children = this.comment.childComments();
    this.listenTo(this.comment, "sync change destroy", this.render);
    this.listenTo(this.children, "add", this.addRender);
  },

  events: { "click .delete-comment": "removeComment",
    "click .upvote-comment": "upvoteComment",
    "click .downvote-comment": "downvoteComment",

  },

  render: function () {

    var content = this.template({comment: this.comment});
    this.$el.html(content);
    this.addButtonRender( this.comment);

    if (this.children.length > 0) {
      this.children.each( this.addRender.bind(this) );
    }

    return this;
  },

  addRender: function (comment) {

    var view = new RedditClone.Views.CommentRow({ comment: comment });
    this.subViews.push(view);
    this.$(' ul').first().append(view.render().$el);
  },

  addButtonRender: function (comment) {

    var view = new RedditClone.Views.CommentReply({
      comment: comment, parentView: this
      });
    this.subViews.push(view);
    this.$('.buttons-container').first().append(view.render().$el);
  },

  remove: function () {
    this.subViews.forEach(function (subView) {
      subView.remove();
    });
    Backbone.View.prototype.remove.call(this);
  },


  upvoteComment: function (event) {
    event.stopPropagation();

    this.comment.upvote();
  },

  downvoteComment: function (event) {
    event.stopPropagation();
    this.comment.downvote();
  },

})
