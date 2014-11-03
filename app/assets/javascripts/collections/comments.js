RedditClone.Collections.Comments = Backbone.Collection.extend({
  url: "api/comments",
  model: RedditClone.Models.Comment,

  // parsePost: function (resposen) {
  //   //take out the response and set it to an attribute
  // }
  getOrFetch: function (id) {
    var comment = this.get(id);
    if (!comment) {
      comment = new RedditClone.Models.Comment({id: id})
      comment.fetch({
        success: function () {
          this.add(comment);
        }.bind(this)
      });
    }else{
      comment.fetch();
    }
    return comment;
  },


});

