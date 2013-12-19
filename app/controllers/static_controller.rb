class StaticController < ApplicationController

  def index
    @articles = Article.where("category != 'blog'").order("updated_at DESC").limit(3)
    @promos = Article.where("promo_file_name <> 'nil'").order("updated_at DESC").limit(4)
    puts
    puts
    puts @promos
    puts
    puts
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

  def submit_contact
    ActionMailer::Base.mail(:from => "postmaster@kokosurance.com", :to => "rcarter@kokosurance.com", :subject => "Contact request for #{params[:first]} #{params[:last]}", :body => "Name: " + params[:first] + " " + params[:last] + "\nEmail: " + params[:email] + "\nPhone: " + params[:phone] + "\nAddress: " + params[:addr1] + "\nCity, State, Zip: " + params[:city] + ", " + params[:state] + " " + params[:zip] + "\nMessage: " + params[:message]).deliver
    flash[:notice] = "Message successfully delivered"
    redirect_to :root
  end

  def submit_quote
    ActionMailer::Base.mail(:from => "postmaster@kokosurance.com", :to => "rcarter@kokosurance.com", :subject => "Quote request for #{params[:first]} #{params[:last]}", :body => "Name: " + params[:first] + " " + params[:last] + "\nEmail: " + params[:email] + "\nPhone: " + params[:phone] + "\nAddress: " + params[:addr1] + "\nCity, State, Zip: " + params[:city] + ", " + params[:state] + " " + params[:zip] + "\nProducts: " + params[:products] + "\nMessage: " + params[:message]).deliver
    flash[:notice] = "Message successfully delivered"
    redirect_to :root
  end

  def legal
  end

  def quote
  end

  def newsletter
  end

end
