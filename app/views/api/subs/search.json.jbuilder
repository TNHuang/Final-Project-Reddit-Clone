json.foundSubs @found_subs do |sub|
  json.id sub.id
  json.title sub.title
  json.votes sub.votes
  json.description sub.description
  json.sub_count sub.subscribers.length
  json.is_moderator current_user.mod_subs.include?(sub)
  json.is_subscribe current_user.subs.include?(sub)
end
json.message "search success"


json.foundPosts @found_posts do |post|
  json.id post.id
  json.title post.title
  json.url post.url
  json.img_url post.img_url
  json.votes post.votes
  json.author_id post.author.id
  json.author post.author.name

  json.comment_count post.comments.length
  json.is_author false
end
