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

    var $target = $(event.currentTarget);
    var sname = $('input#name').val();
    var title = $('input#title').val();
    var description = $('textarea#description').val();


    var newSub = new RedditClone.Models.Sub({name: sname, title: title,  description: description});

    newSub.save({}, {
      success: function () {
        this.subs.add(newSub);
        Backbone.history.navigate("subs", {trigger: true});
      }.bind(this)
    });
  },

});
