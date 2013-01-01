class FrontController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
  end

  def search
  end
end
