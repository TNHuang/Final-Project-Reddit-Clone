RedditClone.Collections.Subs = Backbone.Collection.extend({
  url: "api/subs",
  model: RedditClone.Models.Sub,

  // parsePost: function (resposen) {
  //   //take out the response and set it to an attribute
  // }
  getOrFetch: function (id) {
    var sub = this.get(id);
    if (!sub) {
      sub = new RedditClone.Models.Sub({id: id})
      sub.fetch({
        success: function () {
          this.add(sub);
        }.bind(this)
      });
    }else{
      sub.fetch();
    }
    return sub;
  },

});


RedditClone.Collections.subs = new RedditClone.Collections.Subs();