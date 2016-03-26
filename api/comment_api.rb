# coding: UTF-8
class CommentApi < Grape::API
  include ::Toolkit

  params do
    requires :id, type: Integer
  end
  resources 'articles/:id/comments'
  get do
    Comment.all.find_by(id :params[:id])
  end
  post do
    Comment.add_comment(params[:content], @current_user, params[:id])
  end

  params do
    requires :id, type: Integer
    requires :comment_id, type: Integer
  end
  resources 'articles/:id/comments/:comment_id'
  delete do
    article.comments.delete(params[:id], params[:comment_id])
  end
end