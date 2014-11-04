RedditClone.Models.Post= Backbone.Model.extend({
  urlRoot: "/api/posts",

  comments: function () {
      if(!this._comments) {
        this._comments = new RedditClone.Collections.Comments([], { post: this });
      }

      return this._comments;
    },

  subs: function () {
      if(!this._subs) {
        this._subs = new RedditClone.Collections.Subs([], { post: this });
      }

      return this._subs;
    },


  parse: function (response) {
    if(response.comments) {
      this.comments().set(response.comments, { parse: true });
      delete response.comments;
    }
    if(response.subs) {
      this.subs().set(response.subs, { parse: true });
      delete response.subs;
    }

    return response;
  },


  upvote: function () {
    $.ajax({
      url: "api/posts/" + this.id + "/upvote",
      type: "POST",
      success: function (response) {
        this.set({votes: response.votes});
      }.bind(this)
    })
  },

  downvote: function () {

    $.ajax({
      url: "api/posts/" + this.id + "/downvote",
      type: "POST",
      success: function (response) {
        this.set({votes: response.votes});
      }.bind(this)
    })
  },


})
