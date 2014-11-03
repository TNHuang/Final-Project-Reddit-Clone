RedditClone.Models.Sub = Backbone.Model.extend({
  urlRoot: "/api/subs",

  posts: function () {
      if(!this._posts) {
        this._posts = new RedditClone.Collections.Posts([], { sub: this });
      }

      return this._posts;
    },

  mods: function () {
      if(!this._mods) {
        this._mods = new RedditClone.Collections.Users([], { sub: this });
      }

      return this._posts;
    },


  parse: function (response) {
    if(response.posts) {
      this.posts().set(response.posts, { parse: true });
      delete response.posts;
    }else if (response.mods){
      this.mods().set(response.mods, { parse: true });
      delete response.mods;
    }

    return response;
  }

})