# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create({ name: "Finn" , password: "password", email: "Finn@CandyKindom.com"});
User.create({ name: "Banana Man" , password: "password", email: "Banana@Banana.com"});
User.create({ name: "Jake" , password: "password", email: "MagicDog@Dog.com"});
User.create({ name: "BMO" , password: "password", email: "MyR@boto.com"});
User.create({ name: "Marceline" , password: "password", email: "4ever@twilight.com"});
User.create({ name: "Princess Bubblegum" , password: "password", email: "Bubble@trouble.com"});
User.create({ name: "The Lich" , password: "password", email: "Undead@zombie.com"});
User.create({ name: "Dutch of Chest nut" , password: "password", email: "Chest@Nut.com"});
User.create({ name: "Battle Cube" , password: "password", email: "Battle@Cube.com"});
User.create({ name: "LSP" , password: "password", email: "Omg@Lsp.com"});
User.create({ name: "Flame Princess" , password: "password", email: "Flame@On.com"});
User.create({ name: "Billy" , password: "password", email: "TotallyNotFinn@Billy.com"});
User.create({ name: "Lady Raincorn" , password: "password", email: "Rainicorn@raindow.com"});
User.create({ name: "Ice King" , password: "password", email: "2Kool4Skool@IceKing.com"});
User.create({ name: "Earl of Lemongrab" , password: "password", email: "Unacceptable@lemon.com"});

Sub.create({name: "BMO", title: "BMO", description: "A sub about the most adorable half-Macintosh half-gameboy color"});
Sub.create({name: "News", title: "News of Ooo", description: "News about the land of Ooo"});
Sub.create({name: "wizard_battle", title: "Wizard Battle", description: "No science and weapon allow!"});
Sub.create({name: "history", title: "history", description: "History of Ooo"});
Sub.create({name: "something_big", title: "something big", description: "Attack on something big"});
Sub.create({name: "furniture_and_meat", title: "furniture and meat", description: "one for food, the other for foot"});
Sub.create({name: "food_chain", title: "food chain", description: "learn about food chain by becoming food chain"});

Post.create({title: "BMO does weird junk when no one is around", url: "http://adventuretime.wikia.com/wiki/BMO" , body: "" , author_id: 1})
Post.create({title: "Banana Man", url: "http://adventuretime.wikia.com/wiki/Banana_Man" , body: "To the final froniter" , author_id: 2})
Post.create({title: "Not enough dynamite", body: "need more fire for the rocketship" , author_id: 2})
Post.create({title: "I just want borrow some sugar!", body: "more sugar than a doughnut shop" , author_id: 2})
Post.create({title: "banana man doing the split", url: "http://adventuretime.wikia.com/wiki/File:Banana_Man_splits.png" , author_id: 2})
Post.create({title: "There is not enough boom boom stickhole sticks in the stickhole! Gahh", url: "http://adventuretime.wikia.com/wiki/File:Banana_Man%27s_House.png" , body: "Need more boom boom in the poom poom" , author_id: 2})
Post.create({title: "Fixing truck", body: "truck fixing all around" , author_id: 2})

Post.create({title: "Mushroom war", url: "http://adventuretime.wikia.com/wiki/Mushroom_War" , author_id: 2})
Post.create({title: "that lich guy", body: "don't you wish he never existed" , author_id: 6})
Post.create({title: "one thousand years", body: "any one remember that good old time" , author_id: 7})
Post.create({title: "I remember you", body: "Simon and Marcy" , author_id: 2})
Post.create({title: "Family axe", body: "some kind of lute" , author_id: 3})
Post.create({title: "Nightosphere", body: "Spooky stuff all around" , author_id: 1})


Posting.create({post_id: 1, sub_id: 1});

Posting.create({post_id: 2, sub_id: 1});
Posting.create({post_id: 3, sub_id: 1});
Posting.create({post_id: 4, sub_id: 1});
Posting.create({post_id: 5, sub_id: 1});
Posting.create({post_id: 6, sub_id: 2});
Posting.create({post_id: 7, sub_id: 1});

Posting.create({post_id: 2, sub_id: 2});
Posting.create({post_id: 3, sub_id: 2});
Posting.create({post_id: 4, sub_id: 2});
Posting.create({post_id: 5, sub_id: 2});

Posting.create({post_id: 2, sub_id: 3});
Posting.create({post_id: 3, sub_id: 3});
Posting.create({post_id: 4, sub_id: 3});
Posting.create({post_id: 5, sub_id: 3});

Posting.create({post_id: 8, sub_id: 1});
Posting.create({post_id: 9, sub_id: 2});
Posting.create({post_id: 10, sub_id: 2});
Posting.create({post_id: 11, sub_id: 1});
Posting.create({post_id: 12, sub_id: 1});
Posting.create({post_id: 13, sub_id: 1});

Posting.create({post_id: 14, sub_id: 2});
Posting.create({post_id: 15, sub_id: 3});
Posting.create({post_id: 16, sub_id: 2});
Posting.create({post_id: 17, sub_id: 2});
Posting.create({post_id: 18, sub_id: 2});
Posting.create({post_id: 19, sub_id: 2});
Posting.create({post_id: 20, sub_id: 1});
Posting.create({post_id: 13, sub_id: 5});

Modding.create({moderator_id: 1, sub_id: 1});
Modding.create({moderator_id: 2, sub_id: 1});
Modding.create({moderator_id: 3, sub_id: 1});
Modding.create({moderator_id: 4, sub_id: 1});
Modding.create({moderator_id: 5, sub_id: 1});
Modding.create({moderator_id: 6, sub_id: 1});
Modding.create({moderator_id: 1, sub_id: 2});
Modding.create({moderator_id: 1, sub_id: 3});
Modding.create({moderator_id: 2, sub_id: 4});
Modding.create({moderator_id: 2, sub_id: 3});
Modding.create({moderator_id: 2, sub_id: 5});
Modding.create({moderator_id: 3, sub_id: 3});
Modding.create({moderator_id: 3, sub_id: 4});
Modding.create({moderator_id: 3, sub_id: 5});

Subscription.create({subscriber_id: 1, sub_id: 1})
Subscription.create({subscriber_id: 2, sub_id: 1})
Subscription.create({subscriber_id: 3, sub_id: 1})
Subscription.create({subscriber_id: 4, sub_id: 1})
Subscription.create({subscriber_id: 5, sub_id: 1})
Subscription.create({subscriber_id: 6, sub_id: 1})
Subscription.create({subscriber_id: 7, sub_id: 1})
Subscription.create({subscriber_id: 8, sub_id: 1})
Subscription.create({subscriber_id: 9, sub_id: 1})
Subscription.create({subscriber_id: 10, sub_id: 1})
Subscription.create({subscriber_id: 11, sub_id: 1})
Subscription.create({subscriber_id: 12, sub_id: 1})
Subscription.create({subscriber_id: 13, sub_id: 1})
Subscription.create({subscriber_id: 14, sub_id: 1})

Subscription.create({subscriber_id: 1, sub_id: 2})
Subscription.create({subscriber_id: 2, sub_id: 2})
Subscription.create({subscriber_id: 3, sub_id: 2})
Subscription.create({subscriber_id: 4, sub_id: 2})
Subscription.create({subscriber_id: 5, sub_id: 2})
Subscription.create({subscriber_id: 6, sub_id: 2})
Subscription.create({subscriber_id: 7, sub_id: 2})
Subscription.create({subscriber_id: 8, sub_id: 2})
Subscription.create({subscriber_id: 9, sub_id: 2})
Subscription.create({subscriber_id: 10, sub_id: 2})
Subscription.create({subscriber_id: 11, sub_id: 2})
Subscription.create({subscriber_id: 12, sub_id: 2})
Subscription.create({subscriber_id: 13, sub_id: 2})
Subscription.create({subscriber_id: 14, sub_id: 2})

Subscription.create({subscriber_id: 1, sub_id: 3})
Subscription.create({subscriber_id: 2, sub_id: 3})
Subscription.create({subscriber_id: 3, sub_id: 3})
Subscription.create({subscriber_id: 4, sub_id: 3})
Subscription.create({subscriber_id: 5, sub_id: 3})
Subscription.create({subscriber_id: 6, sub_id: 3})
Subscription.create({subscriber_id: 7, sub_id: 3})
Subscription.create({subscriber_id: 8, sub_id: 3})
Subscription.create({subscriber_id: 9, sub_id: 3})
Subscription.create({subscriber_id: 10, sub_id: 3})
Subscription.create({subscriber_id: 11, sub_id: 3})
Subscription.create({subscriber_id: 12, sub_id: 3})
Subscription.create({subscriber_id: 13, sub_id: 3})
Subscription.create({subscriber_id: 14, sub_id: 3})




