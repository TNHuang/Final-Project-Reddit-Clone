json.extract! @post, :id, :title, :url, :body, :created_at, :updated_at
json.author_name @author.name
json.author_id @author.id
json.votes @post.votes
json.img_url @post.img_url
# json.kommets @comments_by_parent

json.comments @post.comments.where({parent_comment_id: nil}) do |comment|
  json.extract! comment, :id, :body, :author_id, :post_id, :parent_comment_id
  json.votes @votes[comment]
  json.author_name comment.author.name
  json.is_author (comment.author_id == current_user.id)

    json.childComments @comments_by_parent[comment.id] do |child|
      json.partial! 'api/shared/comments',
       { parent_comment: child,
         comments_by_parent: @comments_by_parent,
         votes: @votes}
    end
end
