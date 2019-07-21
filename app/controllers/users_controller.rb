class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    # binding.pry
    @posts = Post.where(user_id: params[:id])
    @user = User.find_by(id: params[:id])

    # フォローしているかの判定
    @follow_check = Follow.find_by(followed_user_id: params[:id], following_user_id: current_user.id)

    #今見ているユーザーがフォローされた場合、comment_controllerにpost_idを渡すための処理
    cookies[:followed_user_id] = params[:id]
  end

  def edit
  end

end
