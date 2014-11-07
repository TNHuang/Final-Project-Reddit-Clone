RedditClone.Views.SubRow = Backbone.View.extend({
  tagName: 'li',
  className: "sub-container row-container",
  template: JST['shared/subrow'],
  initialize: function (options) {
    this.sub = options.sub;
    this.listenTo(this.sub, "sync change destroy", this.render);
  },

  events: {
    "click .delete-sub": "removeSub",
    "click .upvote-sub": "upvoteSub",
    "click .downvote-sub": "downvoteSub",

  },

  render: function () {
    console.log("rendering subview")
    var content = this.template({sub: this.sub});
    this.$el.html(content);
    return this;
  },


  remove: function () {
    Backbone.View.prototype.remove.call(this);
  },

  removeSub: function (event) {
    event.preventDefault();
    this.sub.destroy();
    this.remove();
  },

  upvoteSub: function (event) {
    this.sub.upvote();
  },

  downvoteSub: function (event) {
    this.sub.downvote();
  },

})
