
json.array! @subs do |sub|
  json.id sub.id
  json.title sub.title
  json.description sub.description
  json.votes sub.votes
  json.sub_count sub.subscribers.size
  json.is_moderator current_user.mod_subs.include?(sub)
  # json.moderators sub.moderators do |mod|
  #   extract! mod, :name, :id
  # end

end
