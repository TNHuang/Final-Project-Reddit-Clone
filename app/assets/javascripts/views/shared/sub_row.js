RedditClone.Views.PostRow = Backbone.View.extend({
  tagName: 'tr',
  template: JST['shared/subrow'],
  initialize: function (options) {
    this.subs  = options.subs
    this.model = options.model;
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "click button.delete-sub": "removeSub",

  },

  render: function () {
    var content = this.template({sub: this.model});
    this.$el.html(content);
    return this;
  },

  leave: function () {
    this.remove();
  },

  removeSub: function (event) {
    event.preventDefault();
    var sub_id = $(event.currentTarget).data("id");
    var model = this.subs.get(sub_id);
    model.destroy({
      success: function () {
        Backbone.history.navigate("subs", {trigger: true})
      }
    });
  },

})