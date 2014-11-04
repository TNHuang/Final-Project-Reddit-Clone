RedditClone.Models.Comment = Backbone.Model.extend({
  urlRoot: "/api/comments",
  //
  // child_comments: function () {
  //
  // }
  //
  // parse: function (response) {
  //   //parse some other attribute
  // },

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
