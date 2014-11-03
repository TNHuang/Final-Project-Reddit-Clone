RedditClone.Views.SubsIndex = Backbone.View.extend({
  template: JST["subs/index"],
  className: "add-padding-left",

  initialize: function (options) {
    this.subViews = [];
    this.subs = options.collection;
    this.listenTo(this.collection, "sync remove", this.render);
  },


  render: function () {

    var content = this.template();
    this.$el.html(content);
    var that = this;
    this.subs.forEach(function (sub) {
      var view = new RedditClone.Views.PostRow({ model: sub, subs: that.subs})
      that.subViews.push(view);
      that.$('table').append(view.render().$el);
    });

    return this;
  },

  leave: function () {
    this.subViews.forEach(function (subView) {
      subView.leave();
    });
    this.remove();
  }

})

// _.extend(RedditClone.Utils.OrdView);