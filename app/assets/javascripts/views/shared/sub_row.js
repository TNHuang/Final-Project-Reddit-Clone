RedditClone.Views.SubRow = Backbone.View.extend({
  tagName: 'tr',
  template: JST['shared/subrow'],
  initialize: function (options) {
    this.sub = options.sub;
    this.listenTo(this.sub, "sync change destroy", this.render);
  },

  events: {
    "click button.delete-sub": "removeSub",
    "click .upvote-sub": "upvoteSub",
    "click .downvote-sub": "downvoteSub",
  },

  render: function () {
    console.log("rendering subview")
    var content = this.template({sub: this.sub});
    this.$el.html(content);
    return this;
  },

  // voteRender: function () {
  //   console.log("trigger vote render");
  //   console.log(this.$('.vote-score'))
  //   console.log(this.sub.escape('votes'))
  //   this.$('.vote-score').html(this.sub.votes)
  // },

  remove: function () {
    Backbone.View.prototype.remove.call(this);
  },

  removeSub: function (event) {
    event.preventDefault();
    this.sub.destroy();
  },

  upvoteSub: function (event) {
    this.sub.upvote();
  },

  downvoteSub: function (event) {

    $.ajax({
      url: "api/subs/" + this.sub.id + "/downvote",
      type: "POST",
      success: function () {

        console.log(this.sub.escape('votes'))
      }.bind(this)
    })
  },

})