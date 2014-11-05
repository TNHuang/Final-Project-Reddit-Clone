RedditClone.Views.PostNew = Backbone.View.extend({
  template: JST["posts/new"],
  className: "sidebar",
  initialize: function (options) {
    this.posts = options.posts;
    this.sub = options.sub;
  },

  events: {
    "submit form": "submit"
  },
  render: function () {
    var content = this.template({sub: this.sub});
    this.$el.html(content);
    return this;
  },

  submit: function (event) {
    event.preventDefault();

    var params = $(event.currentTarget).serializeJSON();
    var newPost = new RedditClone.Models.Post(params["post"]);

    // var imgExtract = $.ajax({
    //   type: "GET",
    //   url: response.url,
    //   dataType: "xml",
    //   success: function (xml) {
    //     var image_url= $(html).find($('img').attr("src"));
    //   }
    // })


    newPost.save({sub_id: params["sub_id"]}, {
      success: function () {
        this.posts.add(newPost);
        Backbone.history.navigate("subs/" + this.sub.id , {trigger: true});
      }.bind(this)
    });
  },

});

//
// $.ajax({
// 04
//  type: "GET",
// 05
//  url: "http://www.nyasatimes.com/feed/",
// 06
//  dataType: "xml",
// 07
//  success: function(xml) {
// 08
//  $(xml).find('item').each(function(){
// 09
//  var title = $(this).find('title').text();
// 10
//  var link = $(this).find('link').text();
// 11
//  });
// 12
//  }
