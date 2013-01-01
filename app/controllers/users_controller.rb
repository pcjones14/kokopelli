class UsersController < ApplicationController
  require 'digest/md5'

  def login
    if session[:login] == true
      flash[:error] = "You are already logged in. Please logout to login again."
      redirect_to articles_path
    end
  end

  def login_attempt
    if params[:email] == "rcarter@centralutahclinic.com" and Digest::MD5.hexdigest(params[:password]) == "0958dd9d8965932aee2777e1ea86963d"
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
