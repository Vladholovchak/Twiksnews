class UsersController < ApplicationController
  before_action :authenticate_admin

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    User.find(params[:id]).update(user_params)
  end

  private

  def access_whitelist
    current_user.try(:admin?) || current_user.try(:door_super?)
  end

  def authenticate_admin
    redirect_to root_path, alert: 'Not authorized.' unless current_user && access_whitelist
  end

  def user_params
    params.require(:user).permit(source_ids:[])
  end

end
