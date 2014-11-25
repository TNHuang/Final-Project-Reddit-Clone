RedditClone.Views.UserNew = Backbone.View.extend({
  template: JST["users/new"],

  initialize: function (options) {
    this.users = options.users;
  },

  events: {
    "submit .create-user-form": "createUser",
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    return this;
  },

  createUser: function (event) {
    event.preventDefault();
    var params = $(event.currentTarget).serializeJSON();

    var newUser = new RedditClone.Models.User(params[:user]);
    newUser.save({}, {
      success: function () {
        this.users.add(newUser);
      }.bind(this)
    })
  }

})
