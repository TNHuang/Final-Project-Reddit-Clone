window.RedditClone = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var subs = new RedditClone.Collections.Subs();
    var $head = $("#head");
    var $sidebar = $("#sidebar");
    var $main = $("#main");
    new RedditClone.Routers.Router({subs: subs, $head: $head, $main: $main, $sidebar: $sidebar });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  RedditClone.initialize();
});
