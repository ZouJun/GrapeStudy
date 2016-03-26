class Comment < ActiveRecord::Base
  belongs_to :article

  def self.add_comment(content, name, article_id)
    Comment.create(content: content, name: name, article_id: article_id)
  end

  def self.get_comments(article_id, start, to)
    Comment.all.where(id = article_id)[start...to]
  end

  def self.delete_comment(article_id, comment_id)
    comment = Comment.find_by(id: comment_id).where(article_id = article_id)
    comment.destroy if comment
  end
end