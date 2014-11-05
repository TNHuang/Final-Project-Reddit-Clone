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
User.create({ name: "Flame King" , password: "password", email: "Finn@CandyKindom.com"});
User.create({ name: "Fuzzing king" , password: "password", email: "Banana@Banana.com"});
User.create({ name: "Fire ghost" , password: "password", email: "MagicDog@Dog.com"});
User.create({ name: "Dr Ice Cream" , password: "password", email: "MyR@boto.com"});
User.create({ name: "Party God" , password: "password", email: "4ever@twilight.com"});
User.create({ name: "Martin" , password: "password", email: "Bubble@trouble.com"});
User.create({ name: "Cobbler" , password: "password", email: "Undead@zombie.com"});
User.create({ name: "Phil" , password: "password", email: "Chest@Nut.com"});
User.create({ name: "Old Swans" , password: "password", email: "Battle@Cube.com"});
User.create({ name: "Ant" , password: "password", email: "Omg@Lsp.com"});
User.create({ name: "Ballon" , password: "password", email: "Flame@On.com"});
User.create({ name: "Skeleton butterfly" , password: "password", email: "TotallyNotFinn@Billy.com"});
User.create({ name: "Penny" , password: "password", email: "Rainicorn@raindow.com"});
User.create({ name: "soft people" , password: "password", email: "2Kool4Skool@IceKing.com"});
User.create({ name: "wee wee zee" , password: "password", email: "Unacceptable@lemon.com"});
User.create({ name: "Lump space king" , password: "password", email: "Finn@CandyKindom.com"});
User.create({ name: "My cup cake" , password: "password", email: "Banana@Banana.com"});
User.create({ name: "Fear Feaster" , password: "password", email: "MagicDog@Dog.com"});
User.create({ name: "Fine" , password: "password", email: "MyR@boto.com"});
User.create({ name: "Gmnoe" , password: "password", email: "4ever@twilight.com"});
User.create({ name: "wall of flesh" , password: "password", email: "Bubble@trouble.com"});
User.create({ name: "Toad" , password: "password", email: "Undead@zombie.com"});
User.create({ name: "Snow Monster" , password: "password", email: "Chest@Nut.com"});
User.create({ name: "Gork" , password: "password", email: "Battle@Cube.com"});
User.create({ name: "Witch" , password: "password", email: "Omg@Lsp.com"});
User.create({ name: "Gunter" , password: "password", email: "Flame@On.com"});
User.create({ name: "Mountain men" , password: "password", email: "TotallyNotFinn@Billy.com"});
User.create({ name: "Orge" , password: "password", email: "Rainicorn@raindow.com"});
User.create({ name: "Science Cat" , password: "password", email: "2Kool4Skool@IceKing.com"});
User.create({ name: "Stonesy" , password: "password", email: "Unacceptable@lemon.com"});

subnames = ["Internetisbeautiful", "funny", "pics", "science", "music", "documentaries", "TIL", "sport", "Iama", "explainlikeImfive", "worldnews", "videos", "space"]

des = ["Single purpose websites", "You may only post if you are funny.",
  "A place to share photographs and pictures. Feel free to post your own, but please read the rules first (see below), and note that we are not a catch-all for general images (of screenshots, comics, etc.)",
  "\/r\/science is a moderated subreddit, please review the Rules for Submissions before submitting to \/r\/science, and Rules for Comments before commenting.
Submissions and Comments that violate the rules will be removed, as will all replies to inappropriate comments. Please report violations.",
"The musical community of reddit.", "td:dw", "today I learn", "The central hub for all things sports on reddit.",
"IAmA stands for \"I am a\", and AMA means \"Ask me Anything\". This is the home to interviews, from the extraordinary to the mundane. We have several scheduled celeb AMAs, as well as a near-constant stream of AMAs from regular redditors, just like you!",
"Explain Like I'm Five is the best forum and archive on the internet for layman-friendly Q&A. donn\'t Panic", "A place for major news from around the world, excluding US-internal news.",
"A great place for video content of all kinds. Direct links to major video sites are preferred (e.g. YouTube, Vimeo, etc.)",
"/r/space is dedicated to the insightful and thoughtful discussion of outer space.","/r/space is dedicated to the insightful and thoughtful discussion of outer space.","/r/space is dedicated to the insightful and thoughtful discussion of outer space."]

subnames.each_with_index do |name, index|
  next unless Sub.create({name: name, title: name, description: des[index]});
end


Sub.create({name: "BMO", title: "BMO", description: "A sub about the most adorable half-Macintosh half-gameboy color"});
Sub.create({name: "News", title: "News of Ooo", description: "News about the land of Ooo"});
Sub.create({name: "wizard_battle", title: "Wizard Battle", description: "No science and weapon allow!"});
Sub.create({name: "History", title: "history", description: "History of Ooo"});
Sub.create({name: "Something_big", title: "something big", description: "Attack on something big"});
Sub.create({name: "Furniture_and_meat", title: "furniture and meat", description: "one for food, the other for foot"});
Sub.create({name: "Food_chain", title: "food chain", description: "learn about food chain by becoming food chain"});
Sub.create({name: "Logic Battle", title: "logic", description: "Batlte with your wits and gill"});
Sub.create({name: "Book", title: "These", description: "1"});
Sub.create({name: "Car", title: "are", description: "2"});
Sub.create({name: "truck", title: "clickable", description: "3"});
Sub.create({name: "krok", title: "subs", description: "4"});
Sub.create({name: "suck", title: "go", description: "5"});
Sub.create({name: "kilt", title: "click", description: "6"});
Sub.create({name: "milt", title: "on", description: "7"});
Sub.create({name: "hilt", title: "them", description: "8"});
Sub.create({name: "silt", title: "broken", description: "9"});

t = [ "Rosetta just sent new images taken from about 7.8 km from the surface of comet 67P/C-G.",
  "My Eyewitness Footage of the Orbital Antares Rocket Failure at the Press Site - 2.2 Miles From Launchpad",
  "Antares launch failed, rocket exploded ~10s after liftoff",
  "Antares rocket explosion: The question of un the land of communism and Sputnik.\"",
  "Antares explosion - NASA/Joel Kowsky [pic 4,416×2,947]",
  "Found an original Rand McNally Official map of the moon",
  "Antares rocket explodes 6 seconds after liftoff.",
  "Extraordinary shot of moon's far side and Earth, from Chang'e | Science Wire | EarthSky",
  "Gemini 8 Astronauts David B. Scott and Neil A. Armstrong Water Egress Training",
  "Are there any pictures of the pad and surrounding area yet?",
  "The ISS tracing a line above the Antares rocket",
  "Vortex Star Trail Polar Panorama","Russian rocket manufacturer insists it is not to blame for Antares crash"
]
u = [
  "http://imgur.com/gallery/zvM7V/new",
  "https://www.youtube.com/watch?v=3jCystkiIBs",
  "https://www.reddit.com/r/space/comments/2km5vp/antares_launch_failed_rocket_exploded_10s_after/",
  "http://adventuretime.wikia.com/wiki/Ice_King",
  "http://i.imgur.com/qfgoTNf.jpg",
  "http://i.imgur.com/2WnFuk9.jpg",
  "http://i.imgur.com/ZQfwU0F.png",
  "http://imgur.com/",
  "http://i.imgur.com/ak3rGrx.jpg",
  "http://imgur.com/",
  "http://i.imgur.com/MQjvQoL.jpg?1","http://www.imgur.com/9aUcOIL.jpg","http://www.theguardian.com/science/2014/oct/29/"]
userz = User.all
t.each_with_index do |title, i|
  next unless Post.create({title: title, url: u[i] , author_id: userz.sample.id});
end

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
allusers = User.all
allsubs = Sub.all
allposts = Post.all

#xposting
200.times do
  sub, post = allsubs.sample, allposts.sample
  next if Posting.create({post_id: post.id, sub_id: sub.id })

end
100.times do
  sub, user = allsubs.sample, allusers.sample
  next if Modding.create({moderator_id: user.id, sub_id: sub.id })
end

100.times do
  sub, user = allsubs.sample, allusers.sample
  next if Subscription.create({subscriber_id: user.id, sub_id: sub.id })
end

alltext = subnames + des + t + u

#seed comments
200.times do
  text = alltext.sample
  user, post = allusers.sample,  allposts.sample
  next unless Comment.create({author_id: user.id, body: text, post_id: post.id})

end

500.times do
  text = alltext.sample
  c = Comment.all.sample
  u_id = allusers.sample.id
  next unless Comment.create({author_id: u_id, body: text, post_id: c.post.id, parent_comment_id: c.id})

end
# next unless UserVote.create({ user_id: u_id, votable_id: c.id, votable_type: "Comment", value: [-1, 1].sample })
# next unless UserVote.create({ user_id: u_id, votable_id: c.id, votable_type: "Comment", value: [-1, 1].sample })
# next unless UserVote.create({ user_id: user_id, votable_id: sub.id, votable_type: "Sub", value: [-1, 1].sample })
