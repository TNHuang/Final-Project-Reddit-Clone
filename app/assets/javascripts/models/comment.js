RedditClone.Models.Comment = Backbone.Model.extend({
  urlRoot: "/api/comments",

  childComments: function () {
      if(!this._childComments) {

        this._childComments = new RedditClone.Collections.Comments([], { parentComment: this });
      }

      return this._childComments;
    },

  parse: function (response) {

    if(response.childComments) {

      this.childComments().set(response.childComments, { parse: true });

      delete response.childComments;
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
