RedditClone.Views.PostNew = Backbone.View.extend({
  template: JST["posts/new"],
  className: "sidebar",
  initialize: function (options) {
    this.posts = options.posts;
  },

  events: {
    "submit form": "submit"
  },
  render: function () {
    var content = this.template();
    this.$el.html(content);
    return this;
  },

  submit: function (event) {
    event.preventDefault();

    var params = $(event.currentTarget).serializeJSON();
    var newPost = new RedditClone.Models.Post(params["post"]);

    newPost.save({}, {
      success: function () {
        this.posts.add(newPost);
        window.history.back();
      }.bind(this)
    });
  },

});
