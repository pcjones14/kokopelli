class StaticPagesController < ApplicationController

  def index
    @articles = Article.where("category != 'blog'").order("updated_at DESC").limit(3)
    @promos = Article.where("promo_file_name <> 'nil'").order("updated_at DESC").limit(4)
    flash.now[:page] = "home"
  end

  def article
  end

  def insurance_companies
  end
  
  def clinic_information
  end
  
  def providers
  end
  
  def staff
  end

  def privacy_practice
  end

  def privacy_policy
  end

  def terms_of_use
  end

  def disclaimer
  end

  def contact
  end

  def legal
  end

  def quote
  end

  def newsletter
  end

end
