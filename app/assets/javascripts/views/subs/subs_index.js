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
    "click .unsub": "unsubscribe",
    "submit form": "search"
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

  addRenderForPosts: function (post) {
    var view = new RedditClone.Views.PostRow({ post: post})
    this.subViews.push(view);
    this.$('ol').append(view.render().$el);
  },

  searchRender: function (fsubs, fposts, keyval) {
    var content = this.template({subs: this.subs});
    this.$el.html(content);

    if ( fposts.length === 0 && fsubs.length === 0) {
      this.$('ol').append('<li class="clearfix no-match-container"><div class="no-match-img"></div><div class="no-matches">No Matches Found for \'' + keyval +'\'</div></li>');
      return this;
    }

    if (fsubs.length > 0) {
      fsubs.forEach( this.addRender.bind(this));
    }

    if (fposts.length > 0) {
      fposts.forEach( this.addRenderForPosts.bind(this));
    }

    return this;
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
  },

  search: function (event) {
    event.preventDefault();
    event.stopPropagation();

    var search_val = $('.search-bar').val();

    $.ajax({
      url: "api/multisearch",
      type: "GET",
      data: {search_val: search_val},
      dataType: 'json',
      success: function (response){
        this.subs.parse(response)
        var foundPosts = this.subs.foundPosts();
        var foundSubs = this.subs.foundSubs();
        this.searchRender(foundSubs, foundPosts, search_val);
        // Backbone.history.navigate('#/subs/search?search_val=' + search_val, { trigger: false});
      }.bind(this)
    })

  },



})
