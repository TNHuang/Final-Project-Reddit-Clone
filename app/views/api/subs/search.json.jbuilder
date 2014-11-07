json.found_subs @found_subs do |sub|
  json.id sub.id
  json.title sub.title
  json.votes sub.votes
  json.description sub.description
  json.sub_count sub.subscribers.size
  json.is_moderator false
  json.is_subscribe false
end


json.found_posts @found_posts do |post|
  json.id post.id
  json.title post.title
  json.url post.url
  json.img_url post.img_url
  json.votes json.votes

  json.comment_count post.comments.size
  json.is_author false
end
