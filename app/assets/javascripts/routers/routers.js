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
    "subs": "subsIndex",
    "subs/new": "subNew",
    "subs/:id/edit": "subEdit"
  },

  subsIndex: function () {

    this.subs.fetch();
    var indexView = new RedditClone.Views.SubsIndex({
      collection: this.subs
    });

    this._swapView(indexView, this.$main);

  },

  subNew: function () {
    var newView = new RedditClone.Views.SubNew({subs: this.subs});
    this._swapView(newView, this.$main);
  },

  subEdit: function (id) {
    var model = this.subs.getOrFetch(id);
    var editView = new RedditClone.Views.SubEdit({model: model});
    this._swapView(editView, this.$main);
  },

  _swapView: function (view, $target) {
    this.currentView && this.currentView.remove();
    this.currentView = view;
    $target.html(view.render().$el);
  }
});