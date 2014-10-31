window.RedditClone = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {

    var subs = new RedditClone.Collections.Subs();
    console.log("getting initialize")
    var $head = $("#head");
    var $sidebar = $("#sidebar");
    var $main = $("#main");
    var options = {subs: subs, $head: $head, $main: $main, $sidebar: $sidebar }
    new RedditClone.Routers.Router(options);
    Backbone.history.start();
  }
};

$(document).ready(function(){
  // RedditClone.initialize();
});
