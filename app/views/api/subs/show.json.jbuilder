json.extract! @sub, :id, :name, :title, :description, :created_at, :updated_at

json.subs_count @sub.subscribers.count

json.posts @sub.posts do |post|
  json.extract! post, :id, :title, :url, :created_at, :updated_at
  json.comment_count post.comments.count
  json.is_author @is_author[post]
  json.votes @votes_by_post[post]
  json.author @authors[post].name
  json.author_id @authors[post].id

end

json.mods @sub.moderators do |mod|
  json.id mod.id
  json.name mod.name
end
