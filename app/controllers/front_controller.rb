class FrontController < ApplicationController
  def index
    @articles = Article.where(visible: true).order(:updated_at).page params[:page]
  end

  def show
    @article = Article.find(params[:id])
    @tags = @article.tags.split(",")
  end

  def search
    if !params[:keyword].blank?
      q = "%#{params[:keyword]}%"
      @articles = Article.where("tags LIKE ?", q).where(visible: true).order(:updated_at).page params[:page]
      @string = "keyword \"#{params[:keyword]}\""
    elsif !params[:category].blank?
      @articles = Article.where("category = '#{params[:category]}'").where(visible:true).order(:updated_at).page params[:page]
      @string = "category \"#{params[:category]}\""
    end
  end
end
