RedditClone.Views.PostNew = Backbone.View.extend({
  template: JST["posts/new"],
  className: "sidebar",
  initialize: function (options) {
    this.posts = options.posts;
    this.sub = options.sub;
  },

  events: {
    "submit form": "submit"
  },
  render: function () {
    var content = this.template({sub: this.sub});
    this.$el.html(content);
    return this;
  },

  submit: function (event) {
    event.preventDefault();

    var params = $(event.currentTarget).serializeJSON();
    var newPost = new RedditClone.Models.Post(params["post"]);

    newPost.save({sub_id: params["sub_id"]}, {
      success: function (response) {
        this.posts.add(newPost);
        Backbone.history.navigate("subs/" + this.sub.id , {trigger: true});
        var $target = $('html,body');
        $target.animate({scrollTop: $target.height()}, 1000);
      }.bind(this)
    });
  },

});
