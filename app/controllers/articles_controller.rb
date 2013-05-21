class ArticlesController < ApplicationController
  include ApplicationHelper

  def index
    authenticate
    @articles = Article.order("updated_at DESC").page params[:page]
  end

  def show
    authenticate
    @article = Article.find(params[:id])
  end

  def new
    authenticate
  end

  def create
    authenticate
    article = Article.create( params )
    if article.valid?
      flash[:notice] = "Article successfully created."
      redirect_to articles_path
    else
      flash[:error] = "The following errors occurred: "
      article.errors.each do |field,error|
        flash[:error] += "#{field} #{error}, "
      end
      flash[:error] = flash[:error][0...-2]
      redirect_to :back
    end
  end

  def edit
    authenticate
    @article = Article.find(params[:id])
  end

  def update
    authenticate
    article = Article.find(params[:id])
    article.update_attributes(params[:article])
    if article.valid?
      flash[:notice] = "Article successfully updated."
      redirect_to articles_path
    else
      flash[:error] = "The following errors occurred: "
      article.errors.each do |field,error|
        flash[:error] += "#{field} #{error}, "
      end
      flash[:error] = flash[:error][0...-2]
      redirect_to :back
    end
  end

  def destroy
    authenticate
    Article.destroy(params[:id])
    flash[:notice] = "Article successfully deleted."
    redirect_to articles_path
  end

end
