
json.array! @subs do |sub|
  json.id sub.id
  json.title sub.title
  json.description sub.description
  json.votes @votes_by_sub[sub]
  json.sub_count @subber_count[sub]
  json.is_moderator @is_mod[sub]
  json.is_subscribe @is_subscribe[sub]
end
