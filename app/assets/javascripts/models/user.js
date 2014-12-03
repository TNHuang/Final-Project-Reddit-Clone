RedditClone.Models.User = Backbone.Model.extend({
  urlRoot: "/api/users",
  // 
  // posts: function () {
  //   if(!this._posts) {
  //     this._posts = new RedditClone.Collections.Posts([], { user: this });
  //   }
  //
  //   return this._posts;
  // },
  //
  // modSubs: function () {
  //   if(!this._modSubs) {
  //     this._modSubs = new RedditClone.Collections.Subs([], { user: this });
  //   }
  //   return this._modSubs;
  // },
  //
  // subs: function () {
  //   if(!this._subs) {
  //     this._subs = new RedditClone.Collection.Subs([], { user: this})
  //   }
  //   return this._mods;
  // },
  //
  // parse: function (response) {
  //   if(response.posts) {
  //     this.posts().set(response.posts, { parse: true });
  //     delete response.posts;
  //   }
  //   if (response.modSubs){
  //     this.modSubs().set(response.modSubs, { parse: true });
  //     delete response.modSubs;
  //   }
  //
  //   if (response.subs){
  //     this.subs().set(response.subs, { parse: true });
  //     delete response.subs;
  //   }
  //   return response;
  // }

})
