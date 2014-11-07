RedditClone.Views.CommentReply = Backbone.View.extend({
  template: JST["comments/new"],
  className: "comment-reply-container",
  initialize: function (options) {
    this.comment = options.comment;
    this.children = this.comment.childComments();
    this.parentView = options.parentView;
  },

  events: {
    "click .reply-comment-toggle": "toggleReplyComment",
    "submit .reply-comment-form": "replyComment",
    "click .edit-comment-toggle": "toggleEditComment",
    "submit .edit-comment-form": "editComment",
    "click .delete-comment": "deleteComment",
    "click .cancel-button": "cancelWindow"
  },

  render: function () {
    var content = this.template({ comment: this.comment });
    this.$el.html(content);
    return this;
  },

  toggleReplyComment: function (event) {
    event.stopPropagation();
    $(event.currentTarget).toggleClass('hidden');

    this.$(' > .cancel-button').removeClass('hidden');
    this.$(' > .reply-comment-wrapper').toggleClass('hidden');

    //close other window
    var $edit = this.$(' > .edit-comment-wrapper');
    if (!$edit.hasClass('hidden')) {
      $edit.toggleClass('hidden');
      this.$('> .edit-comment-toggle').toggleClass("hidden");
    }
  },

  replyComment: function (event) {
    event.preventDefault();
    event.stopPropagation();

    var params = $(event.currentTarget).serializeJSON();
    var newComment = new RedditClone.Models.Comment(params["comment"]);

    this.comment.createComment(newComment, params, this.children);

    this.$('> .reply-comment-toggle').toggleClass("hidden");
    this.$('> .reply-comment-wrapper').addClass('hidden');
    this.$(' > .cancel-button').addClass('hidden');
  },


  toggleEditComment: function (event) {
    event.stopPropagation();
    $(event.currentTarget).toggleClass('hidden');

    this.$(' > .cancel-button').removeClass('hidden');
    this.$(' > .edit-comment-wrapper').toggleClass('hidden');

    //close other window
    var $reply = this.$(' > .reply-comment-wrapper');
    if (!$reply.hasClass('hidden')) {
      $reply.toggleClass('hidden');
      this.$('> .reply-comment-toggle').toggleClass("hidden");
    }
  },

  editComment: function (event) {
    event.preventDefault();
    event.stopPropagation();

    var params = $(event.currentTarget).serializeJSON();
    this.comment.editComment(params);

    this.$('> .edit-comment-toggle').toggleClass("hidden");
    this.$('> .edit-comment-wrapper').addClass('hidden');
    this.$(' > .cancel-button').addClass('hidden');
  },

  deleteComment: function (event) {
    event.stopPropagation();
    event.preventDefault();
    this.comment.destroy();
    this.parentView.remove();
  },

  cancelWindow: function (event) {
    $(event.currentTarget).toggleClass('hidden');

    var $reply = this.$(' > .reply-comment-wrapper');
    var $edit = this.$(' > .edit-comment-wrapper');

    if (!$reply.hasClass('hidden')) {
      $reply.toggleClass('hidden');
      this.$('> .reply-comment-toggle').toggleClass("hidden");
    }

    if (!$edit.hasClass('hidden')) {
      $edit.toggleClass('hidden');
      this.$('> .edit-comment-toggle').toggleClass("hidden");
    }
  }
})
