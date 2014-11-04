RedditClone.Views.PostEdit = Backbone.View.extend({
  template: JST["posts/edit"],
  className: "sidebar",
  initialize: function (options) {
    this.sub = options.sub;
    this.post = options.post;
    this.listenTo(this.post, "sync change", this.render);
  },
  events: {
    "submit form": "submit"
  },

  render: function () {
    var content = this.template({ post: this.post, sub: this.sub });
    this.$el.html(content);
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var params = $(event.currentTarget).serializeJSON();

    this.post.save( {post: params["post"], sub_id: this.sub.id} ,{
      success: function () {
       Backbone.history.navigate( "subs/" + this.sub.id , { trigger: true})
     }.bind(this)
    })
  }
});
