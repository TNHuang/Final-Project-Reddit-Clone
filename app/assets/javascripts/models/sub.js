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
      return this._mods;
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

  upvote: function () {
    var sub = this;
    $.ajax({
      url: "api/subs/" + this.id + "/upvote",
      type: "POST",
      success: function (response) {
        this.set({votes: response.votes});
      }.bind(this)
    })
  },

  downvote: function () {

    $.ajax({
      url: "api/subs/" + this.id + "/downvote",
      type: "POST",
      success: function (response) {
        this.set({votes: response.votes});
      }.bind(this)
    })
  },

  subscribe: function () {

    $.ajax({
      url: "api/subs/" + this.id + "/subscribe",
      type: "POST",
      data: {id: this.id},
      success: function (response) {
        this.set({is_subscribe: response.is_subscribe});
      }.bind(this)
    })
  },

  unsubscribe: function () {
    $.ajax({
      url: "api/subs/" + this.id + "/unsubscribe",
      type: "DELETE",
      data: {id: this.id},
      success: function (response) {
        this.set({is_subscribe: response.is_subscribe});
      }.bind(this)
    })
  },


})
