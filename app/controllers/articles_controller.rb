class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    Article.create(title: params[:title], body: params[:body], tags: params[:tags], visible: params[:visible])
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])
    redirect_to articles_path
  end

  def destroy
    Article.destroy(params[:id])
    redirect_to articles_path
  end

end
