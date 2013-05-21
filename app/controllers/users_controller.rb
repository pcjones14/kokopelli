class UsersController < ApplicationController
  require 'digest/md5'

  def login
    if session[:login] == true
      flash[:error] = "You are already logged in. Please logout to login again."
      redirect_to articles_path
    end
  end

  def login_attempt
    if params[:email] == "rcarter@centralutahclinic.com" and Digest::MD5.hexdigest(params[:password]) == "5f4dcc3b5aa765d61d8327deb882cf99"
      session[:login] = true
      flash[:notice] = "Successfully logged in."
      redirect_to articles_path
    else
      flash[:error] = "Login failed. Please try again."
      redirect_to :back
    end
  end

  def edit
  end

  def destroy_session
    session[:login] = false
    flash[:notice] = "Successfully logged out."
    redirect_to root_path
  end
end
