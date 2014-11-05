RedditClone.Views.CommentRowSingle = Backbone.View.extend({
  tagName: 'li',
  className: "comment-container",
  template: JST['shared/commentrow_single'],
  initialize: function (options) {

    this.subViews = [];
    this.comment = options.comment;
    this.listenTo(this.comment, "sync change destroy", this.render);
    this.listenTo(this.comment, "add", this.addRender);
  },

  events: { "click button.delete-comment": "removeComment",
    "click .upvote-comment": "upvoteComment",
    "click .downvote-comment": "downvoteComment",
  },

  render: function () {

    var content = this.template({comment: this.comment});
    this.$el.html(content);

    if (this.comment.childComments().length > 0) {
      this.comment.childComments().forEach( this.addRender.bind(this) );
    }

    return this;
  },

  addRender: function (comment) {
    console.log('im rendering')
    var view = new RedditClone.Views.CommentRowSingle({ comment: comment})
    this.subViews.push(view);
    this.$('> ul').append(view.render().$el);
  },

  remove: function () {
    this.subViews.forEach(function (subView) {
      subView.remove();
    });
    Backbone.View.prototype.remove.call(this);
  },


  upvoteComment: function (event) {
    this.comment.upvote();
  },

  downvoteComment: function (event) {
    this.comment.downvote();
  },

})
