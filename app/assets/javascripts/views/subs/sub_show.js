RedditClone.Views.SubShow = Backbone.View.extend({
  template: JST["subs/show"],

  initialize: function (options) {
    this.sub = options.sub;
    this.listenTo(this.sub, "sync change remove add", this.render);
  },

  events: {

  },
  render: function () {
    var content = this.template({sub: this.sub});
    this.$el.html(content);
    return this;
  },


});
