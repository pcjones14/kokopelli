class StaticPagesController < ApplicationController

  def index
    @articles = Article.last(2)

    @promos = Article.where("promo_file_name <> 'nil'").order("updated_at DESC").limit(4)
  end

  def article
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

end
