# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new; end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
      flash[:success] = "Welcome, #{user.name}!"
    else
      flash[:alert] = "Error: #{error_message(user.errors)}"
      redirect_to '/register'
    end
  end

  def user_params
    params.permit(:name, :email, :password)
  end
end
