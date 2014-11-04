RedditClone.Models.Comment = Backbone.Model.extend({
  urlRoot: "/api/comments",

  child_comments: function () {
      if(!this._child_comments) {
        this._child_comments = new RedditClone.Collections.Comments([], { post: this });
      }

      return this._child_comments;
    },

  parse: function (response) {
    console.log("inside parse", response.child_comments)
    if(response.child_comments) {

      this.child_comments().set(response.child_comments, { parse: true });
      delete response.child_comments;
    }

    return response;
  },


  upvote: function () {
    $.ajax({
      url: "api/comments/" + this.id + "/upvote",
      type: "POST",
      success: function (response) {
        this.set({votes: response.votes});
      }.bind(this)
    })
  },

  downvote: function () {

    $.ajax({
      url: "api/comments/" + this.id + "/downvote",
      type: "POST",
      success: function (response) {
        this.set({votes: response.votes});
      }.bind(this)
    })
  },

})
