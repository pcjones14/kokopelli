class FrontController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @tags = @article.tags.split(",")
  end

  def search
    q = "%#{params[:keyword]}%"
    @articles = Article.where("tags LIKE ?", q)
    puts @articles
  end
end
