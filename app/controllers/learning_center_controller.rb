class LearningCenterController < ApplicationController
  include ApplicationHelper
  def index
    @articles = Article.where(visible: true).where("category != 'blog'").order('updated_at DESC').page params[:page]
  end

  def show
    begin
      @article = Article.find(params[:id])
      @tags = @article.tags.split(",")
    rescue
      flash[:error] = "Article with that id was not found"
      redirect_to learning_center_index_path
    end
  end

  def search
    if !params[:keyword].blank?
      q = "%#{params[:keyword]}%"
      @articles = Article.where("tags LIKE ?", q).where(visible: true).order("updated_at DESC").page params[:page]
      parsed_keyword = parse_keywords(params[:keyword])
      @string = "with keyword \"#{parsed_keyword}\""
    elsif !params[:category].blank?
      @articles = Article.where("category = '#{params[:category]}'").where(visible:true).order("updated_at DESC").page params[:page]
      cat_string = parse_keywords(params[:category])
      @string = "in category \"#{cat_string}\""
    end
  end
end
