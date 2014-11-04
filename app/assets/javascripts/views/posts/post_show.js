RedditClone.Views.PostShow = Backbone.View.extend({
  template: JST["posts/show"],

  initialize: function (options) {
    this.subViews = [];
    this.post = options.post;
    this.listenTo(this.post, "sync", this.render);
    this.listenTo(this.post, "add", this.addRender);
  },

  render: function () {
    var content = this.template({post: this.post});
    this.$el.html(content);

    var top_level_comments = this.post.comments().where({parent_comment_id: null });
    top_level_comments.forEach( this.addRender.bind(this) );
    
    return this;
  },

  addRender: function (comment) {
    var view = new RedditClone.Views.CommentRow({ comment: comment})
    this.subViews.push(view);
    this.$('ul').append(view.render().$el);
  },

  remove: function () {
    this.subViews.forEach(function (subView) {
      subView.remove();
    });
    Backbone.View.prototype.remove.call(this);
  }

})
