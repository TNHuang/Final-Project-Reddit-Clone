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



  foundSubs: function () {
    if(!this._foundSubs) {
      this._foundSubs = new RedditClone.Collections.Subs([], { subs: this });
    }
    return this._foundSubs;
  },

  foundPosts: function () {
    if(!this._foundPosts) {
      this._foundPosts = new RedditClone.Collections.Posts([], { subs: this });
    }
    return this._foundPosts;
  },

  parse: function (response) {
    if (response.foundSubs) {
      this.foundSubs().set(response.foundSubs, { parse: true });
      delete response.foundSubs;
    }

    if (response.foundPosts) {
      this.foundPosts().set(response.foundPosts, { parse: true });
      delete response.foundPosts;
    }
    return response;
  },


});
