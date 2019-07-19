class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    # binding.pry
    @posts = Post.where(user_id: params[:id])
    @user = User.find_by(id: params[:id])
  end

  def edit
  end

end
