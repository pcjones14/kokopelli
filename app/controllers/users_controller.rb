class UsersController < ApplicationController
  require 'digest/md5'
  include ApplicationHelper

  def index
    @users = User.all
  end

  def show
    
  end

  def new

  end

  def create
    user = User.create(email: params[:email], name: params[:name], password: Digest::MD5.hexdigest(params[:password]), bio: params[:bio], avatar: params[:avatar])
    if user.valid?
      flash[:notice] = "User successfully created."
      redirect_to users_path
    else
      flash[:error] = "The following errors occurred: "
      user.errors.each do |field,error|
        flash[:error] += "#{field} #{error}, "
      end
      flash[:error] = flash[:error][0...-2]
      redirect_to :back
    end
  end

  def edit

  end

  def update

  end

  def destroy
    User.destroy(params[:id])
    flash[:notice] = "User successfully destroyed."
    redirect_to users_path
  end

  def login
    if session[:login] == true
      flash[:error] = "You are already logged in. Please logout to login again."
      redirect_to articles_path
    end
  end

  def login_attempt
    if user = User.find_by_email(params[:email])
      if Digest::MD5.hexdigest(params[:password]) == user.password
        session[:login] = true
        flash[:notice] = "Successfully logged in."
        redirect_to articles_path
      else
        flash[:error] = "Incorrect email or password. Please try again."
        redirect_to :back
      end
    else
      flash[:error] = "Incorrect email or password. Please try again."
      redirect_to :back
    end
  end

  def destroy_session
    session[:login] = false
    flash[:notice] = "Successfully logged out."
    redirect_to root_path
  end
end