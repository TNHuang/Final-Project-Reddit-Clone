
json.array! @subs do |sub|
  json.id sub.id
  json.title sub.title
  json.description sub.description
  json.votes sub.votes
  json.sub_count sub.subscribers.size
  json.is_moderator sub.moderators.include?(current_user)
end
