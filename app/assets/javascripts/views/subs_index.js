RedditClone.Views.SubsIndex = Backbone.View.extend({
  template: JST["subs/index"],

  initialize: function (options) {
    this.subs = options.collection;
    this.listenTo(this.collection, "sync ", this.render);
  },

  render: function () {
    // console.log(this.subs)
    var content = this.template({subs: this.collection});
    this.$el.html(content);
    return this;
  }
})