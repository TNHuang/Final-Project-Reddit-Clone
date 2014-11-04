RedditClone.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$main = options.$main;
    this.$head = options.$head;
    this.$sidebar = options.$sidebar;

    this.subs = options.subs;
    this.posts = new RedditClone.Collections.Posts();
    this.users = new RedditClone.Collections.Users();
    this.comments = new RedditClone.Collections.Comments();
  },

  routes: {
    "": "index",
    "subs": "subsIndex",
    "subs/new": "subNew",
    "subs/:id": "subShow",
    "subs/:id/edit": "subEdit",
    "posts/new": "postNew",
    "posts/:id/edit": "postEdit"
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

  subShow: function (id) {
    var sub = this.subs.getOrFetch(id);
    var showView = new RedditClone.Views.SubShow({sub: sub});
    this._swapView(showView, this.$main);
  },


  subEdit: function (id) {
    var sub = this.subs.getOrFetch(id);
    var editView = new RedditClone.Views.SubEdit({ sub: sub });
    this._swapView(editView, this.$main);
  },

  postNew: function () {
    var newView = new RedditClone.Views.PostNew({posts: this.posts});
    this._swapView(newView, this.$main);
  },

  postEdit: function (id) {
    var post = this.posts.getOrFetch(id);
    var editView = new RedditClone.Views.PostEdit({post: post, posts: this.posts});
    this._swapView(editView, this.$main);
  },

  _swapView: function (view, $target) {
    this.currentView && this.currentView.remove();
    this.currentView = view;
    $target.html(view.render().$el);
  }
});
