json.extract! @sub, :id, :name, :title, :description, :created_at, :updated_at

json.subs_count @sub.subscribers.count

json.posts @sub.posts do |post|
  json.extract! post, :id, :title, :url, :body, :created_at, :updated_at
  json.comment_count post.comments.count
end

json.mods @sub.moderators do |mod|
  json.id mod.id
  json.name mod.name
end