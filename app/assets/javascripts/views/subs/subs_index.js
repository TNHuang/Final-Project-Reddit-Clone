RedditClone.Views.SubsIndex = Backbone.View.extend({
  template: JST["subs/index"],
  className: "add-padding-left",

  initialize: function (options) {

    this.subViews = [];
    this.subs = options.collection;
    this.listenTo(this.subs, "sync", this.render);
    this.listenTo(this.subs, "add", this.addRender);
  },

  render: function () {
    var content = this.template();

    this.$el.html(content);
    this.subs.forEach( this.addRender.bind(this));

    return this;
  },

  addRender: function (sub) {
    var view = new RedditClone.Views.SubRow({ sub: sub})
    this.subViews.push(view);
    this.$('table').append(view.render().$el);
  },


  remove: function () {
    this.subViews.forEach(function (subView) {
      subView.remove();
    });
    Backbone.View.prototype.remove.call(this);
  }

})
