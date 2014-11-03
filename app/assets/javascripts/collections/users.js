RedditClone.Collections.Users = Backbone.Collection.extend({
  url: "api/users",
  model: RedditClone.Models.User,

  // parsePost: function (resposen) {
  //   //take out the response and set it to an attribute
  // }
  getOrFetch: function (id) {
    var user = this.get(id);
    if (!user) {
      user = new RedditClone.Models.User({id: id})
      user.fetch({
        success: function () {
          this.add(user);
        }.bind(this)
      });
    }else{
      user.fetch();
    }
    return user;
  },

});

