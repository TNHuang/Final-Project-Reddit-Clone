RedditClone.Views.SubsIndex = Backbone.View.extend({
  template = JST["subs/index"],

  initialize: function (options) {
    this.subs = options.collection
  }

  render: function () {
    var content = this.template(subs: this.collection);
    this.$el.html(content);
    return this;
  }
})