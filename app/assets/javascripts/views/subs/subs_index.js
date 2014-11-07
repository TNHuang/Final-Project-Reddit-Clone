RedditClone.Views.SubsIndex = Backbone.View.extend({
  template: JST["subs/index"],
  className: "subs-index-container",

  initialize: function (options) {

    this.subViews = [];
    this.subs = options.collection;
    this.listenTo(this.subs, "sync change", this.render);
    this.listenTo(this.subs, "change", this.addRender);
  },

  events: {
    "click .sub": "subscribe",
    "click .unsub": "unsubscribe"
  },

  render: function () {
    var content = this.template({subs: this.subs});

    this.$el.html(content);
    this.subs.forEach( this.addRender.bind(this));

    return this;
  },

  addRender: function (sub) {
    var view = new RedditClone.Views.SubRow({ sub: sub})
    this.subViews.push(view);
    this.$('ol').append(view.render().$el);
  },


  remove: function () {
    this.subViews.forEach(function (subView) {
      subView.remove();
    });
    Backbone.View.prototype.remove.call(this);
  },

  subscribe: function (event) {
    event.stopPropagation();
    var sub_id = $(event.currentTarget).data('id');
    this.subs.getOrFetch(sub_id).subscribe();
  },

  unsubscribe: function (event) {
    event.stopPropagation();
    var sub_id = $(event.currentTarget).data('id');
    this.subs.getOrFetch(sub_id).unsubscribe();
  }


})
