RedditClone.Views.SubNew = Backbone.View.extend({
  template: JST["subs/new"],
  initialize: function (options) {
    this.subs = options.subs;
  },

  events: {
    "submit form": "submit"
  },
  render: function () {
    var content = this.template();
    this.$el.html(content);
    return this;
  },

  submit: function (event) {
    event.preventDefault();

    var params = $(event.currentTarget).serializeJSON();
    var newSub = new RedditClone.Models.Sub(params["sub"]);

    newSub.save({sort: false}, {
      success: function () {
        this.subs.add(newSub);
        Backbone.history.navigate("subs", {trigger: true});


      }.bind(this)
    });
  },

});
