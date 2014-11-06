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

  createComment: function (newComment, params, children) {
    var post_id = this.escape('post_id');
    $.ajax({
      url: "api/posts/" + post_id + "/comments",
      type: "POST",
      data: params ,
      dataType: 'json',
      success: function (response) {
        newComment.set({
          is_author: response.is_author,
          votes: response.votes,
          author_id: response.author_id,
          author_name: response.author_name,
          parent_comment_id: response.parent_comment_id,
          id: response.id
          });
        children.add(newComment);

        var height = $('#'+response.id).offset().top;
        $('body, html').scrollTop(height);
      }.bind(this)
    })
  },

  editComment: function (params) {
    var post_id = this.escape('post_id');

    $.ajax({
      url: "api/posts/" + post_id + "/comments/" + this.get('id'),
      type: "PATCH",
      data: params ,
      dataType: 'json',
      success: function (response) {
        this.set({
          is_author: response.is_author,
          votes: response.votes,
          author_id: response.author_id,
          author_name: response.author_name,
          parent_comment_id: response.parent_comment_id,
          body: response.body,
          id: response.id
          });
        var height = $('#'+response.id).offset().top;
        $('body, html').scrollTop(height);
      }.bind(this)
    });
  },


})
