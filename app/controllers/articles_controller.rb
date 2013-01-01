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
    article = Article.create(title: params[:title], body: params[:body], tags: params[:tags], visible: params[:visible])
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
    @article = Article.find(params[:id])
  end

  def update
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
    Article.destroy(params[:id])
    flash[:notice] = "Article successfully deleted."
    redirect_to articles_path
  end

end
