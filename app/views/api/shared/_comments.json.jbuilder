json.extract! parent_comment, :id, :body, :author_id, :post_id, :parent_comment_id
json.votes votes[parent_comment]
json.author_name parent_comment.author.name

# if comments_by_parent[parent_comment.id].size > 0

  json.childComments comments_by_parent[parent_comment.id] do |comment|
    json.partial! 'api/shared/comments',
     { parent_comment: comment,
       comments_by_parent: comments_by_parent,
       votes: votes}
  # end

end
