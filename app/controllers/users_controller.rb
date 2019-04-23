# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all.order(email: :desc)
    authorize @users
  end

  def show
    @user = User.find(params[:id])
    @user_sources = NewsSource.find(@user.news_source_ids)
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update(user_params)
      redirect_to users_path, notice: 'User updated.'
    else
      redirect_to users_path, alert: 'Unable to update user.'
    end
  end

  private

  def user_params
    params.require(:user).permit(:role, :status, :send_news)
  end
end
