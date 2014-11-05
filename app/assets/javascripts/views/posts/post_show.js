RedditClone.Views.PostShow = Backbone.View.extend({
  template: JST["posts/show"],

  initialize: function (options) {
    this.subViews = [];
    this.post = options.post;
    this.comments = this.post.comments();
    this.listenTo(this.post, "sync", this.render);
    // this.listenTo(this.post, "add", this.addRender);
  },

  render: function () {
    var content = this.template({post: this.post});
    this.$el.html(content);
    var comments = this.post.comments();
    comments.forEach( this.addRender.bind(this) );
    // if (comments.length > 0) {
    //   comments.forEach( this.addRender.bind(this) );
    // }
    // // var count = 1;
    // var rec = function (comments, count) {
    //   comments.forEach(function (comment) {
    //     that.$el.append(" "+count+": "+comment.id);
    //     if (comment.child_comments) {
    //       func(comment.child_comments, count+1);
    //     }
    //   })
    // }
    // if (comments) {
    //   func(comments, count)
    // }
    // var rec = function (comments) {
    //   comments.forEach( function (comment) {
    //     that.addRender(comment)
    //     if (comment.child_comments().size > 0 ) {
    //       console.log(comment.child_commets())
    //       that.rec(comment.child_comments())
    //     }
    //   });
    // }
    //
    // if (comments){
    //   rec(comments)
    // }
    //
    // // console.log(this.post.comments().where({parent_comment_id: null }))


    return this;
  },

  addRender: function (comment) {
    var view = new RedditClone.Views.CommentRowSingle({ comment: comment})
    this.subViews.push(view);
    this.$('> ul').append(view.render().$el);
  },

  remove: function () {
    this.subViews.forEach(function (subView) {
      subView.remove();
    });
    Backbone.View.prototype.remove.call(this);
  }

})
