RedditClone.Views.SubEdit = Backbone.View.extend({
  template: JST["subs/edit"],

  initialize: function (options) {
    this.sub = options.sub;
    this.subs = this.subs;
    this.listenTo(this.sub, "sync change", this.render);
  },
  events: {
    "submit form": "submit"
  },

  render: function () {
    var content = this.template({
      sub: this.sub
    });
    this.$el.html(content);
    return this;
  },

  submit: function (event) {
    event.preventDefault();

    // var $target = $(event.currentTarget);
    // var sname = $('input#name').val();
    // var title = $('input#title').val();
    // var description = $('textarea#description').val();

    var params = $(event.currentTarget).serializeJSON();


    this.sub.save(params["sub"],{
      success: function () {
       Backbone.history.navigate("subs", { trigger: true });
      }
    })
  }
});
