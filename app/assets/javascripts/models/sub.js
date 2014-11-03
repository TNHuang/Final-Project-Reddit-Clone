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

  upvote: function () {
    var sub = this;
    $.ajax({
      url: "api/subs/" + this.id + "/upvote",
      type: "POST",
      success: function (response) {
        console.log(response.json)
        sub.set({votes: sub.get('votes') + 1 });
        console.log("upvote success")
      }
    })
  },

  downvote: function () {

    $.ajax({
      url: "api/subs/" + this.id + "/downvote",
      type: "POST",
      success: function () {
        sub.set({votes: sub.get('votes') -1 });
      }
    })
  },

  parse: function (response) {
    if(response.posts) {
      this.posts().set(response.posts, { parse: true });
      delete response.posts;
    }
    if (response.mods){
      this.mods().set(response.mods, { parse: true });
      delete response.mods;
    }

    return response;
  },

})