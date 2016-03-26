# coding: UTF-8
class ArticleApi < Grape::API
  helpers ::Toolkit
  prefix :articles

  get do
    Article.all.as_json(include: {user: {only: [:username, :id]}})
  end
  params do
    requires :title, type: String
    requires :content, type: String
  end
  post do
    require_authorization!
    article = Article.new
    article.add_article(params[:title], params[:content], @current_user)
  end

  params do
    requires :id, type: Integer
  end
  resources ':id' do
    after_validation do
      article = Article.new
      @article = Article.find(params[:id])
    end
    get do
      @article
    end
    post do
      require_authorization!
      article.edit_article(params[:id], params[:title], params[:content])
    end
    delete do
      require_authorization!
      article = Article.new
      article.delete_article(params[:id])
    end
  end

end