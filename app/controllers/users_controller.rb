class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @posts = Post.where(user_id: current_user.id)
    @user = User.find_by(id: current_user.id)
  end


end
