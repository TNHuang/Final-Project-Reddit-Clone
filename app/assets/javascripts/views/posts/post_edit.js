RedditClone.Views.PostEdit = Backbone.View.extend({
  template: JST["posts/edit"],
  className: "sidebar",
  initialize: function (options) {
    this.post = options.post;
    this.listenTo(this.post, "sync change", this.render);
  },
  events: {
    "submit form": "submit"
  },

  render: function () {
    var content = this.template({ post: this.post });
    this.$el.html(content);
    return this;
  },

  Postmit: function (event) {
    event.preventDefault();
    var params = $(event.currentTarget).serializeJSON();

    this.post.save(params["post"],{
      success: function () {
       window.history.back()
      }
    })
  }
});
