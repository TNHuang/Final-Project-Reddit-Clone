RedditClone.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$main = options.$main;
    this.$head = options.$head;
    this.$sidebar = options.$sidebar;
    this.subs = options.subs;
    // Router({subs: subs, $head: $headnav, $main: $main });
  },

  routes: {
    "": "index",
    "subs": "subsIndex"
  },

  subsIndex: function () {

    this.subs.fetch();
    var indexView = new RedditClone.Views.SubsIndex({
      collection: this.subs
    });

    this._swapView(indexView, this.$main);

  },

  _swapView: function (view, $target) {
    this.currentView && this.currentView.remove();
    this.currentView = view;
    $target.html(view.render().$el);
  }
});