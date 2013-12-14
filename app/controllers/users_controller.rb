class UsersController < ApplicationController
  require 'digest/md5'
  include ApplicationHelper

  def index
    authenticate
    @users = User.all
  end

  def show
    authenticate
  end

  def new
    authenticate
  end

  def create
    authenticate
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
    authenticate
    @user = User.find(params[:id])
  end

  def update
    authenticate
    user = User.find(params[:id])
    user.update_attributes(params[:user])
    if user.valid?
      flash[:notice] = "User successfully updated."
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

  def destroy
    authenticate
    User.destroy(params[:id])
    flash[:notice] = "User successfully deleted."
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

  def update_password
    authenticate
    if Digest::MD5.hexdigest(params[:old_password]) != User.find(params[:id]).password
      flash[:error] = "Old password does not match. Please enter old password again."
      redirect_to :back
    elsif params[:new_password].blank?
      flash[:error] = "New password field empty. Please enter a new password."
      redirect_to :back
    elsif params[:new_password] != params[:new_password_verify]
      flash[:error] = "Passwords do not match. Please enter passwords again."
      redirect_to :back
    else
      if User.find(params[:id]).update_attributes(password: Digest::MD5.hexdigest(params[:new_password]))
        flash[:notice] = "User password edited successfully."
        redirect_to edit_user_path(params[:id])
      else
        flash[:error] = "FATAL DATABASE ERROR"
        redirect_to :back
      end
    end
  end

end