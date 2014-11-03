RedditClone.Collections.Posts = Backbone.Collection.extend({
  url: "api/posts",
  model: RedditClone.Models.Post,

  // parsePost: function (resposen) {
  //   //take out the response and set it to an attribute
  // }
  getOrFetch: function (id) {
    var post = this.get(id);
    if (!post) {
      post = new RedditClone.Models.Post({id: id})
      post.fetch({
        success: function () {
          this.add(post);
        }.bind(this)
      });
    }else{
      post.fetch();
    }
    return post;
  },

});

