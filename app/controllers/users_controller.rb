class UsersController < ApplicationController

  def signin

  end

  def show
    if user_signed_in?
      @posts = Post.where(user_id: current_user.id)
    else
      render :action => "signin"
    end
  end


end
