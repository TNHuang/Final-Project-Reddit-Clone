json.extract! @sub, :id, :name, :title, :description, :created_at, :updated_at

json.subs_count @sub_count

json.posts @posts do |post|
  json.id post.id
  json.title post.title
  json.url post.url
  json.body post.body
  json.author @authors[post].name
  json.author_id @authors[post].id
  json.votes @votes_by_post[post]

  json.is_author @is_author[post]
  json.comment_count post.comments.count

  json.img_url post.img_url
end

json.mods @mods do |mod|
  json.id mod.id
  json.name mod.name
end
