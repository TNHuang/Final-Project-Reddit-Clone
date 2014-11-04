json.extract! @post, :id, :title, :url, :body, :created_at, :updated_at
json.author_name @author.name
json.author_id @author.id
json.votes @post.votes

json.comments @post.comments do |comment|
  json.extract! comment, :id, :body, :author_id, :parent_comment_id
  json.votes @votes[comment]
  json.author_name comment.author.name
  json.child_comments @comments_by_parent_id[comment]
end

json.subs @post.subs
# json.parent_comment_ids @post.comments_by_parent.each do | parent_comment_id |
#
#   json.comments parent_comment_id.each do |comment|
#     json.extract! comment, :id, :body
#     json.author_id @author_by_comment[comment].id
#     json.author_name @author_by_comment[comment].name
#     json.is_author @author_by_comment[comment].id == current_user.id
#   end
#
# end
