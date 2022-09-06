# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new; end

  def create
    user = User.new(user_params)
    # binding.pry
    if params[:password] != params[:password_conf]
      flash[:alert] = "Error: Mismatching passwords"
    elsif params[:password] == nil || params[:password_conf] == nil
      flash[:alert] = "Error: Blank password"
    elsif user.save
      redirect_to "/users/#{user.id}"
      flash[:success] = "Welcome, #{user.name}!"
    else
      flash[:alert] = "Error: Please try again."
      redirect_to '/register'
    end
  end

  def user_params
    params.permit(:name, :email, :password)
  end
end
