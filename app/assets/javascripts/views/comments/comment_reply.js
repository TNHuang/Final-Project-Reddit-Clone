RedditClone.Views.CommentReply = Backbone.View.extend({
  template: JST["comments/new"],

  initialize: function (options) {
    this.comment = options.comment;
  },
  events: {
    "click .reply": "toggleCreateComment",
    "submit .new-comment-form": "createNewComment",
  }
  render: function () {
    var content = this.template({comment: this.commnet})
    this.$el.html(content);
    return this;
  },

  toggleCreateComment: function (event) {
    var $target = $(event.currentTarget);
    $target.$('button')
  }
})
