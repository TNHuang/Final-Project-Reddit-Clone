RedditClone.Views.CommentReply = Backbone.View.extend({
  template: JST["comments/new"],
  className: "comment-reply-container",
  initialize: function (options) {
    this.comment = options.comment;
  },
  events: {
    "click .reply-comment-toggle": "toggleReplyComment",
    "submit .reply-comment-form": "replyComment",
  },
  render: function () {
    var content = this.template({comment: this.comment})
    this.$el.html(content);
    return this;
  },

  toggleReplyComment: function (event) {
    event.stopPropagation();
    $(event.currentTarget).toggleClass('hidden');
    this.$(' > .reply-comment-wrapper').toggleClass('hidden');
  },

  replyComment: function (event) {
    event.preventDefault();
    event.stopPropagation();

    var params = $(event.currentTarget).serializeJSON();
    console.log(params)

    this.$('> .reply-comment-toggle').toggleClass("hidden")
    this.$('> .reply-comment-wrapper').addClass('hidden');

  },
})
