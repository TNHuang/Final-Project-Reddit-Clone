window.RedditClone = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {

    RedditClone.current_user = window.current_user;

    var subs = new RedditClone.Collections.Subs();

    var subnavView = new RedditClone.Views.SubNav({ subs: subs });
    var $subnav = $(".subs-nav");
    $subnav.html(subnavView.render().$el);

    var $head = $("#head");
    var $sidebar = $("#sidebar");
    var $main = $("#main");
    var options = {subs: subs, $head: $head, $main: $main, $sidebar: $sidebar }
    new RedditClone.Routers.Router(options);
    Backbone.history.start();
  }
};

$(document).ready(function(){

  RedditClone.initialize();
});
