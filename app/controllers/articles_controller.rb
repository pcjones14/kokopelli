class ArticlesController < ApplicationController
  include ApplicationHelper

  def index
    authenticate
    @articles = Article.order("updated_at DESC").page params[:page]
  end

  def show
    authenticate
    @article = Article.find(params[:id])
    @tags = @article.tags.split(",")
  end

  def new
    authenticate
    users = User.all
    @options = []
    users.each do |user|
      @options += [[user.name, user.id]]
    end
  end

  def create
    authenticate
    article = Article.create(title: params[:title], body: params[:body], tags: params[:tags], visible: params[:visible], promo: params[:promo], image: params[:image], category: params[:category], user_id: params[:user_id])
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
    users = User.all
    @options = []
    users.each do |user|
      @options += [[user.name, user.id]]
    end
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

  def delete_promo
    article = Article.find(params[:id])
    article.promo.destroy
    article.save
    flash[:notice] = "Promo deleted"
    redirect_to :back
  end

  def delete_image
    article = Article.find(params[:id])
    article.image.destroy
    article.save
    flash[:notice] = "Image deleted"
    redirect_to :back
  end

end
