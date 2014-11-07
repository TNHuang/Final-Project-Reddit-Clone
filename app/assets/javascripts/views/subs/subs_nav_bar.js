RedditClone.Views.SubNav = Backbone.View.extend({
  template: JST['shared/subsnav'],


  initialize: function (options) {
    this.subs = options.subs;
    this.listenTo(this.subs, 'sync add remove change', this.render)
  },

  events: {
    "click .toggle-subreddits": "toggleSubreddits"
  },

  render: function () {
    var content = this.template({ subs: this.subs });
    this.$el.html(content);
    return this;
  },

  toggleSubreddits: function (event) {
    $target = $(event.currentTarget);
    $target.toggleClass('test-toggle');
  }



})
