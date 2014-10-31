json.extract! @sub, :id, :name, :title, :description, :created_at, :updated_at

json.subs_count @sub.caculate_subscribers

json.posts @sub.posts do |post|
  json.id post.id
  json.title post.title
  json.url post.url
  json.body post.body
  json.comment_count post.comments.count
end

json.mods @sub.mods do |mod|
  json.id mod.id
  json.name mod.name
end