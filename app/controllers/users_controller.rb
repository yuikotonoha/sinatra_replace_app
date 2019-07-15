class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    # @posts = Post.where(user_id: current_user.id)
    @posts = Post.where(user_id: params[:id])
    @user = User.find_by(id: params[:id])
  end

  def edit
  end

end
