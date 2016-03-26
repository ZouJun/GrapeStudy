class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  # self.comments
  #
  # self.user

  # User.find(self.user_id)

  def get_article(start, to)
    Article.all[start...to]
  end

  def add_article(title, content ,user)
    Article.create!(title: title, content: content, user: user)
  end

  def edit_article(article_id, title, content)
    article = Article.find_by(id: article_id)
    article.update_attributes(title: title, content: content)
  end

  def delete_article(article_id)
    Article.find(article_id).destroy
  end
end