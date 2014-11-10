RedditClone.Views.SubShow = Backbone.View.extend({
  template: JST["subs/show"],


  initialize: function (options) {
    this.subViews = [];

    this.sub = options.sub;
    this.posts = this.sub.posts();

    this.listenTo(this.sub, "sync remove", this.render);
    this.listenTo(this.sub, "add", this.addRender);
  },
  //
  events: {
    "submit form": "search"
  },

  render: function () {

    var content = this.template({sub: this.sub});
    this.$el.html(content);
    this.posts.forEach( this.addRender.bind(this));

    return this;
  },

  addRender: function (post) {
    var view = new RedditClone.Views.PostRow({ post: post, sub: this.sub})
    this.subViews.push(view);
    this.$('> ol.posts-wrapper').append(view.render().$el);
  },
  addRenderForSubs: function (sub) {
    var view = new RedditClone.Views.SubRow({ sub: sub})
    this.subViews.push(view);
    this.$('> ol.posts-wrapper').append(view.render().$el);
  },
  //
  searchRender: function (fsubs, fposts, keyval) {
    var content = this.template({sub: this.sub});
    this.$el.html(content);

    if ( fposts.length === 0 && fsubs.length === 0) {
      this.$('ol').append('<li class="clearfix no-match-container"><div class="no-match-img"></div><div class="no-matches">No Matches Found for \'' + keyval +'\'</div></li>');
      return this;
    }

    if (fsubs.length > 0) {
      fsubs.forEach( this.addRenderForSubs.bind(this));}

    if (fposts.length > 0) {
      fposts.forEach( function(post){
        this.addRender(post);
      }.bind(this))
    }

    return this;
  },

  remove: function () {
    this.subViews.forEach(function (subView) {
      subView.remove();
    });
    Backbone.View.prototype.remove.call(this);
  },
  //
  search: function (event) {
    event.preventDefault();
    event.stopPropagation();

    var dummysubs = new RedditClone.Collections.Subs();
    var search_val = $('.search-bar').val();

    $.ajax({
      url: "api/multisearch",
      type: "GET",
      data: {search_val: search_val},
      dataType: 'json',
      success: function (response){
        dummysubs.parse(response)
        var foundPosts = dummysubs.foundPosts();
        var foundSubs = dummysubs.foundSubs();
        // Backbone.history.navigate('#/subs/' + this.sub.id, { trigger: false});
        this.searchRender(foundSubs, foundPosts, search_val);
        //
      }.bind(this)
    })

  },


});
