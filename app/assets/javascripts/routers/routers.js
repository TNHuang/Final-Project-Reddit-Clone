RedditClone.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$main = options.$main;
    this.$head = options.$head;
    // Router({subs: subs, $head: $headnav, $main: $main });
  },

  routes: {
    "": "index",
    "subs": "subsIndex"
  },

  subsIndex: function () {
    alert("index view getting called");
    var subs = new TrelloClone.Collections.Subs.fetch();
    var indexView = new RedditClone.Views.BoardsIndex({
      collection: subs
    });

    this._swapView(indexView);
  },

  _swapView: function (view, $el) {
    this.currentView && this.currentView.remove();
    this.currentView = view;

    this.$el.html(view.render().$el);
  }
})