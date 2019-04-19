class UsersController < ApplicationController

  def index
    @users = User.all
    authorize @users
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

#  def update
  #  User.find(params[:id]).update(user_params)
#  end

  private

 # def user_params
 #   params.require(:user).permit(source_ids:[])
 # end

end
